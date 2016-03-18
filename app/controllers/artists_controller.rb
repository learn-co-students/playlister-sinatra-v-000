class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :"artists/show"
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :artist
  end

end