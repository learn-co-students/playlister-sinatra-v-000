class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all

    erb :'/genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    song_id = SongGenre.all.find(@genre.id).song_id
    @genre_songs = Song.all.find(song_id)
    @genre_artists = Artist.all.find(@genre_songs.artist_id)

    erb :'/genres/show'
  end

end