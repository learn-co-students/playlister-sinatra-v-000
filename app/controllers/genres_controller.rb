class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    binding.pry
    @songs = []
    Song.all.each do |song|
      if @artist.id == song.artist_id
        @songs << song
      end
    end
    @genres = []
    @songs.each do |song|
      song.song_genres.each do |genre|
        @genres << Genre.find(genre.genre_id)
      end
    end
    erb :'artists/show'
  end

end
