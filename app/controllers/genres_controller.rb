class GenresController < ApplicationController

  get '/genres' do
    @genres = Song.all

    erb :'genres/index'
  end

  get '/genres/:id' do
    @genre = Genre.find(params[:id])
    erb :'genres/show'
  end
end
