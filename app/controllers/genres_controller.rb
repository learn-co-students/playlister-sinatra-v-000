class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    @artists = Artist.all
    @songs = Song.all
    erb :index
  end


end
