class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'/genre/index'
  end
end
