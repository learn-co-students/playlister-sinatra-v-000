class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
  end


end
