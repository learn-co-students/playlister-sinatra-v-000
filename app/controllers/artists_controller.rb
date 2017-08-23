class ArtistsController < ApplicationController

  get '/artists' do
    @artists = artist.all

    erb :'artists/index'
  end

  get '/artists/:id' do
    @artist = Artist.find(params[:id])
    erb :'artists/show'
  end
end
