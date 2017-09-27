require 'pry'
class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    @songs = []
    @genres = []
    Song.all.each do |song|
      if song.artist_id == @artist.id
        @songs << song
        @sg = SongGenre.find(song.id)
        @genre = Genre.find(@sg.genre_id)
        @genres << @genre
      end
    end

    erb :'/artists/show'
  end

end
