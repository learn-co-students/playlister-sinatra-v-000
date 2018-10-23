class ArtistsController < ApplicationController

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])

  end

  get '/artists' do
    @artists = Artist.all

    erb :'/artists/index'
  end

  get '/artists/:id' do
    @artist = Artist.find_by_id(params[:id])
  end
end
