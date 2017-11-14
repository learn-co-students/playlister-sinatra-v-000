class GenresController < ApplicationController

  get '/genres' do
    @genre = Genre.all
    erb :'/genre/index'
  end
end
