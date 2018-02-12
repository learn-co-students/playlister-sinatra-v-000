class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb:'genres/index'
  end

  get '/genres/:slug' do

    @genre = Genre.find_by_slug(params[:slug])
    if @genre
      song_genre = SongGenre.find_by genre_id: @genre.id
      id = song_genre.id
      @song = Song.find(id)
      @artist = @song.artist
      erb:'genres/show'
    else
      redirect '/genres'
    end
  end
end
