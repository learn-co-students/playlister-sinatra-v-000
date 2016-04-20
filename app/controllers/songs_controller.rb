class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  post '/songs' do
    @song = Song.create(song_name:params["song_name"], artist_id:Artist.find_or_create_by(name: params["artist_name"]).id)
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
     @song = Song.find_by_slug(params[:slug])
     erb :'songs/show'
  end

  patch '/songs/:slug' do
   @song = Song.find_by_slug(params[:slug])
   @updated = "Song successfully updated."
   @song.name = params[:song_name]
   @song.artist = Artist.find_or_create_by(name: params[:artist_name])
   @song.save
   erb :'songs/show'
 end

  get '/songs/:slug/edit' do
     @song = Song.find_by_slug(params[:slug])
     erb :'songs/edit'
  end



end