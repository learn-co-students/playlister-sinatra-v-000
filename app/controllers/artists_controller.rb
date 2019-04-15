class ArtistsController < ApplicationController

    get 'artists' do
    @artist = Artist.all
    erb :'artists/index'


  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'artists/show'
  end
end


  
