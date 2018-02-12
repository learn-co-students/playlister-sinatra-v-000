class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb:'artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    if @artist
      id = @artist.id
      @song = Song.find_by artist_id: id
      @song_genre = SongGenre.find_by song_id: @song.id
      genre_id = @song_genre.genre_id
      @genre = Genre.find(genre_id)
      erb:'artists/show'
    else
      redirect '/artists'
    end
  end
end
