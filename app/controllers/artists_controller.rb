class ArtistsController < ApplicationController

  get '/artists' do
    @artist = Artist.all
    erb :'/artists/index'
  end

  get '/artists' do

    erb :'/artists'
  end


end
