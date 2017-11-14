class ArtistsController < ApplicationController

  get '/artists' do
    @artist = Artist.all
    erb :'/artist/index'
  end
end
