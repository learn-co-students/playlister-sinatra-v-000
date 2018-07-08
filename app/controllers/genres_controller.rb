class GenresController < ApplicationController
  use Rack::Flash

  get '/genres' do
    @genres = Genre.all
    
    erb :'/genres/index'
  end


  get '/genres/:id' do
    # slug_name = find_by_slug
    @genre = Genre.find(params[:id])
    erb :'/genres/show'
  end


end
