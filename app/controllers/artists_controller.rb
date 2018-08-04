class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/songs/:name' do
    erb :'songs/show'
  end
end
