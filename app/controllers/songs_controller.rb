class SongsController < ApplicationController

  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get "/songs/new" do
    @genres = Genre.all
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    #binding.pry
    erb :'/songs/show'
  end

  post '/songs' do
    @song = Song.new({name: params[:name]})
    params[:genres].each do |e|
      genre = Genre.find_by(name: e)
      @song.genres << genre if !@song.genres.include?(genre)
    end

    artist = Artist.find_or_create_by({name: params[:artist_name]})
    @song.artist = artist
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get  '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'/songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    #binding.pry
    params[:genres].each do |e|
      genre = Genre.find_by(name: e)
      @song.genres << genre if !@song.genres.include?(genre)
    end

    artist = Artist.find_or_create_by({name: params[:artist_name]})
    @song.artist = artist
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

end
