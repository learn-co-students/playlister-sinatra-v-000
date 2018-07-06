class GenresController < ApplicationController
  use Rack::Flash

  get '/genres' do
    @genres = Genre.all
    
    erb :'/genres/index'
  end


  get '/genres/:slug' do
    # slug_name = find_by_slug
    @genre = Genre.find_by_slug(params[:slug])
    erb :'/genres/show'
  end


end
