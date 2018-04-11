class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all

    erb :'artists/index'
  end

  get '/artists/:slug' do
    @songs = Song.all
    @artists = Artist.all

    erb :'artists/show'
  end

end
