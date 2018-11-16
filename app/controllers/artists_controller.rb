class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    @songs = Song.find_by(artist_id: @artist.id)
    song_genre = SongGenre.find_by(song_id: @songs.id)
    @genre = Genre.find_by_id(song_genre.genre_id)

    erb :'/artists/show'
  end
end
