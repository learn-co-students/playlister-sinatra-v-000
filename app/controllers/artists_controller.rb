class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  # placeholder for get 'artists/new' do

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'/artists/show'
  end

end
