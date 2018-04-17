class ArtistsController < ApplicationController
  get '/artists' do
    @artist_list = Artist.all
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    @sluggish = Artist.find_by_slug(params[:slug])
    erb :'/artists/show'
  end
end
