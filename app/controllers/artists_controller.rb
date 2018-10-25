class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all

    erb :'artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'/artists/show'

  end

  get '/artists/:id' do
    @artist = Artist.find_by_id(params[:id])
  end
end
