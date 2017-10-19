class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :"/artists/artist"
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :"/artists/show"
  end
end
