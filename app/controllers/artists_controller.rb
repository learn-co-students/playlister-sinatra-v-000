class ArtistsController < ApplicationController

  get '/artists' do
    erb :'/artists/artists'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'/artists/show'
  end
  
end 