class GenresController < ApplicationController

  get '/genres' do
  #  @genres = Genre.all
    erb :'genres/index'
  end

  post '/genres' do
  end


end
