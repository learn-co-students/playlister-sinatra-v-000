class ArtistsController < ApplicationController
  use Rack::Flash
  
  get '/artists' do 
    @artists = Artist.all 
    erb :'artists/index'
  end
    
  
  get '/artists/:id' do
    # slug_name = # find_by_slug
    @artist = Artist.find(params[:id])
    erb :'artists/show'
  end
  
end


