class GenresController < ApplicationController
  
  #display a list of all genres in library
  get '/genres' do 
    @genres = Genre.all
    erb :"/genres/index"
  end 
  
  
  #display the genres songs & artists, with links to each
  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :"/genres/show"
  end
  
  


end