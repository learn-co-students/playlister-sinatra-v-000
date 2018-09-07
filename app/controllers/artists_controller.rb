class ArtistsController < ApplicationController
  
  get '/artists' do
    @artists = Artist.all 
    erb :'artists/index'
  end
  
  get '/artists/slug' do
    @artists = 
    erb :'artists/show'
  end
end
