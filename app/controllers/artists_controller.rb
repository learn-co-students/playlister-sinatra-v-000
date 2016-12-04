

class ArtistsController < ApplicationController

  get '/artists' do 
    @artists = Artist.all

    erb :'/artists/index'
  end



  get '/artists/:id' do 
    @artist = Artist.find_by()

    
  end


end



