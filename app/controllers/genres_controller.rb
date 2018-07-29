class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    @song = Song.find_by_id(SongGenre.find_by(genre_id: @genre.id).song_id)
    @artist = Artist.find_by_id(@song.artist_id)
    erb :'/genres/show'
  end
end # GenresController
