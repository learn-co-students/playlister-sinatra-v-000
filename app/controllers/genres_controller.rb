require 'rack-flash'

class GenresController < ApplicationController
  #use Rack::Flash

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    #binding.pry
    # @song = Artist.find(@song.artist_id)
    # @song_genre = SongGenre.find_by(song_id: @song.id)
    # @genre = Genre.find_by(id: @song_genre.genre_id)
    erb :'/genres/show'
  end

end
