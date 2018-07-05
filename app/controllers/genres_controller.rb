class GenresController < ApplicationController
  use Rack::Flash
  
  get '/genres' do 
    @genres = Genre.all 
    erb :'genre/index'
  end
    
  
  get '/genres/:slug' do
    slug_name = # find_by_slug
    @genre = Genre.find_by_slug(slug_name)
    erb :'genre/show'
  end
  
  
end