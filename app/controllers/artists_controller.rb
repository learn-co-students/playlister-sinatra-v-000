class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all  
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    erb :'/artists/show'
  end

end
