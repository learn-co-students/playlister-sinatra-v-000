class ArtistsController < ApplicationController

  get '/artists' do
    #binding.pry
    @artists = Artist.all

    erb :'/artists/index'
  end

end
