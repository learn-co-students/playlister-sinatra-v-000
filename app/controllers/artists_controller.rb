class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'artists/artists'
  end

  get '/artists/new' do
    erb :'artists/new_artist'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'artists/artist'
  end

end
