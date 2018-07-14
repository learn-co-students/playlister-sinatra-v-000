class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all

    erb :'songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find(@song.artist_id)

    songgenre = SongGenre.find_by song_id: @song.id
    @genre = Genre.find(songgenre.genre_id)

    erb :'songs/show'
  end

end
