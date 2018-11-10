class ArtistsController < ApplicationController

  get '/artists' do
     @artists = Artist.all
     binding.pry
     erb :'artists/index'
  end

end
