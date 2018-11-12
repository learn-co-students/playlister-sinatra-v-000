class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @slug = Song.find_by_slug(params[:slug].gsub("-"," "))
    @artist = Artist.find(@slug.artist_id)
    erb :'songs/show'
  end

  post '/songs' do
    @artist = params[:artist_name]
    @genre = params[:genre_name]
    new_song = Song.create(name: params[:song_name])
    new_song.artist = Artist.create(name:@artist)
    new_song.genres << Genre.create(name:@genre)
  end

end
