class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])
    @song.artist = Artist.find_by_id(@song.artist_id)

    genre_id = SongGenre.find_by_id(@song.id).genre_id
    @genre = Genre.find_by_id(genre_id)
    
    erb :'/songs/show'
  end

end
