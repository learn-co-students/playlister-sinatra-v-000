class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end


  get '/genres/:slug' do
    @genres = Genre.all
    erb :"/artists/show"
  end
end
