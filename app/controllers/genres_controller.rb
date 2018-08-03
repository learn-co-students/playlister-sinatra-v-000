class GenresController < ApplicationController
  get '/artists' do
    @genres = Genre.all
    erb :'/genres/index'
  end
end
