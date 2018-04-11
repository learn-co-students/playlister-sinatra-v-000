class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/genres/:slug' do
    @genres = Genre.all
    @songs = Song.all
    @artists = Artist.all

    erb :'genres/show'
  end

end
