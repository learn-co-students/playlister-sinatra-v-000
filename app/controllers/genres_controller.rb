class GenresController < ApplicationController
  
  get '/genres' do
    @genres = Genre.All
    erb :'genres/index'
  end
end