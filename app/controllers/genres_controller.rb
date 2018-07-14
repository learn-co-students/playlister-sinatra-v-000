class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all

    erb :'genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    @songs = []
    @artists = []

    SongGenre.all.where("genre_id = ?", @genre.id).each do |sg|
      @songs << Song.find(sg.song_id)
    end

    @songs.each do |s|
      @artists << Artist.find(s.artist_id)
    end

    erb :'genres/show'

  end

end
