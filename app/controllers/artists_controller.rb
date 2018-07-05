class ArtistsController < ApplicationController
  use Rack::Flash
  
  get '/artists' do 
    @artists = Artist.all 
    erb :'artists/index'
  end
    
  
  get '/artists/:slug' do
    slug_name = # find_by_slug
    @artist = Artist.find_by_slug(slug_name)
    erb :'artists/show'
  end
  
end


