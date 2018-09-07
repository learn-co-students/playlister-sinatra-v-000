class GenresController < ApplicationController
  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/genres/:id' do
    @genre = Genre.find_by_slug(params[:id])
    erb :'genres/show'
  end
end