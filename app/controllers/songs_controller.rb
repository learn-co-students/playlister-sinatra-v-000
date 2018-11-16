class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do

    artist_name = params[:songs][:artist][:name]

    if Artist.find_by(name: artist_name)
      @artist = Artist.find_by(name: artist_name)
    else
      @artist = Artist.create(name: artist_name)
    end

    @song = Song.create(name: params[:songs][:name], artist: @artist)
    params[:songs][:genres].each do |genre|
      @song.genres << Genre.find(genre)
    end

    flash[:message] = "Successfully created song."
    redirect :"/songs/#{@song.slug}"
  end

  # patch '/songs/:slug' do
  #   binding.pry
  #   redirect :"/songs/#{params[:slug]}"
  # end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    # binding.pry
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'/songs/edit'
  end
end
