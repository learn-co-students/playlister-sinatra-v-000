class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :"artists/index"
  end

  get '/artists/:slug' do
    "Here is your artist!"
  end

end
