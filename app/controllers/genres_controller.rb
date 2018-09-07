class GenresController < ApplicationController
  
  get '/genres' do
    @genres = Genre.All
    erb :'genres/index'
  end
  
  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'genres/show'
  end
end