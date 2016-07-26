class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
#    "Hello World"
    binding.pry
    erb :'/artists/index'
  end

end
