class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :"songs/new"
  end

  get '/songs/:id' do
    @song = Song.find_by_slug(params[:id])
    erb :"songs/show"
  end

  post '/songs' do
    song = Song.create(params[:song])
    song.artist = Artist.find_or_create_by(name: params[:artist_name])
    song.save

    redirect "/songs/#{song.slug}"
  end

end
