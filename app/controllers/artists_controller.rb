class ArtistsController < ApplicationController

  get '/artists' do

    erb :'artist/index'

  end

end
