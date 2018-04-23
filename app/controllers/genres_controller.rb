class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    @songs = []
    SongGenre.all.each do |sg|
      #binding.pry
      if @genre.id == sg.genre_id
        @songs << Song.find(sg.song_id)
      end
    end
    @artists = []
    @songs.each do |song|
      @artists << song.artist
    end
    #binding.pry
    erb :'genres/show'
  end

end
