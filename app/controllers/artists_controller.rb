class ArtistsController < ApplicationController

  get '/artists' do
    erb :'songs/index'
  end

end
