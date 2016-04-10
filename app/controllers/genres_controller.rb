class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  post '/genres' do
    erb :index
  end

  get '/genres/:slug' do
    @songs = []
      @genre = Genre.find_by_slug(params["slug"])
        @song_genres = SongGenre.find(@genre.id)
          @songs << Song.all.find(@song_genres.song_id)
    @artists = []
      @songs.each do |s|
        @artists << Artist.find(s.id)
      end
    erb :'/genres/show'
  end

end