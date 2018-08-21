class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'artist/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'artist/show'
  end

  get '/artists/:slug' do

  end


end
