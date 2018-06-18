class GenresController < ApplicationController

  # get '/genres' do
  #   @genres = Genre.all
  #   erb :'genres/index'
  # end


    get '/genres' do
      @genres = Genre.all
      erb :"genres/index"
    end
end
