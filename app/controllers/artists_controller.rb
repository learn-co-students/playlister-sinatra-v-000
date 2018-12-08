class ArtistsController < ApplicationController
  
  #display a list of all artists in library
  get '/artists' do 
    @artists = Artist.all
    erb :"artists/index"
  end 
  
  
  #display the artists songs & genres, with links to each
  get '/artists/:slug' do 
    @artist = Artist.find_by_slug(params[:slug])
    erb :"/artists/show"
  end
  
  


end
