class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artist/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :show
  end

end
