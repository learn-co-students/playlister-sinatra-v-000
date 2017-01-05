class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  # placeholder for get 'genre/new' do

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'/genres/show'
  end

end
