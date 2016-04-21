class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all

    erb :'/genres/index'
  end

  get '/genres/:slug' do
    #binding.pry
    @genre = Genre.find_by_slug(params[:slug])
    song_id = SongGenre.all.find(@genre.id).song_id
    @genre_songs = Song.all.find(song_id)
    @genre_artists = Artist.all.find(@genre_songs.artist_id)
#Any given genre's show page should have 
#links to each of its artists and songs. 
    erb :'/genres/show'
  end
  
end