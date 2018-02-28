class ArtistsController < ApplicationController

  # ----- INDEX -----

  get '/artists' do
    erb :'/artists/index'
  end

  # ----- READ -----

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'/artists/show'
  end

end
