class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :artists
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :show_artist
  end

end
