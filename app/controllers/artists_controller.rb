class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :artists
  end

  get '/artists/:id' do
    @artist = Artist.find_by_id(params[:id])
    erb :show_artist
  end

end
