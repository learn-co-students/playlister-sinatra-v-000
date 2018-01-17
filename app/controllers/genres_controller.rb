class GenresController < ApplicationController

  get '/genres' do
    # This should present the user with a list of all genres in the library.
    # Each genre should be a clickable link to that particular genre's show page.
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/genres/:slug' do
    # Any given genre's show page should have links to each of its artists and songs.
    @genre = Genre.find_by_slug(params[:slug])
    @songs = Song.find_by(artist_id: @genre.id)
    # binding.pry
    song_genres = SongGenre.find_by(genre_id: @genre.id)
    @songs = Song.find_by_id(song_genres.song_id)
    erb :'genres/show'
  end

end
