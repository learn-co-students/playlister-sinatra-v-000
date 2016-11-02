class ArtistsController < ApplicationController

  get '/artists' do
    #presents user list of all songs in lib.
    #each song should be clickable link
    @artists = Artist.all
    erb :'/artists/index'
  end

end
