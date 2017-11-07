class SongsController < ApplicationController

  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    #binding.pry
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all

    erb :"/songs/edit"
  end

  post '/songs' do
    @song = Song.new
    @song.name = params[:song][:name]
    if !params[:song][:artist_name].empty?
      @song.artist = Artist.find_or_create_by(name: params[:song][:artist_name])
    end
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  patch '/songs' do
    @song = Song.find_or_create_by(name: params[:song][:name])
    if !params[:song][:artist_name].empty?
      @song.artist = Artist.find_or_create_by(name: params[:song][:artist_name])
    end

    @song.save

    flash[:message] = "Successfully updated song."
    redirect redirect "/songs/#{@song.slug}"
  end
end
