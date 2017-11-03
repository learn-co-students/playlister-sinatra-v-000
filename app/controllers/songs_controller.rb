class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :"/song/songs"
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :"/song/new"
  end

  post '/songs' do
    song = Song.new(name: params[:song_name])
    song.artist = Artist.find_or_create_by(name: params[:artist_name])
    song.genre_ids = (params[:genres])
    song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
  
    erb :"/song/show"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/song/edit"
  end

end
