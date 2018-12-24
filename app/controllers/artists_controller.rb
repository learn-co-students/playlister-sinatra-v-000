class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'/artist/index'
  end
end
