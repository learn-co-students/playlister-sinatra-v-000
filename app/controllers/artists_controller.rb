class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artists/:slug' do

    # @artist = Artist.find_by_slug(params)
    erb :'/artists/params[:slug]'
  end
end
