class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    #binding.pry
    @songs = []
    SongGenre.all.each do |sg|
      #binding.pry
      if sg.genre_id == @genre.id
        @songs << Song.find(sg.song_id)
      end
    end
    @artists = []
    @songs.each do |song|
      #binding.pry
      @artists << song.artist
    end
    #binding.pry
    erb :'genres/show'
  end

end
