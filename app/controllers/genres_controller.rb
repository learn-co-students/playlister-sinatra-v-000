class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all

    erb :'/genres/index'
  end

  get '/genres/:slug' do
    genre = Genre.find_by_slug(params[:slug])
    genre_name = genre.name
    @genre_id = Genre.find_by(:name => genre_name).id
    @song_id = SongGenre.find_by(@genre_id).song_id
    @genre_songs = Song.find_by(:id => @song_id)

    @artist_id = @genre_songs.artist_id
    @genre_artist = Artist.find_by(:id => @artist_id).name

    erb :'/genres/show'
  end

end
