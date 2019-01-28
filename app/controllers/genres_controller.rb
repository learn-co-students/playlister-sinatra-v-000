class GenresController < ApplicationController
  
  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index' 
  end
  
  get '/genres/:slug' do
    @genres = Genre.all
    @genres = Genre.find_by_slug(params[:slug])
    erb :'/genres/show' 
  end
  
end
