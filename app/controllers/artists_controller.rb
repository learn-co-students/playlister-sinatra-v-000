class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get "/artists/new" do
    erb :'/artists/new'
  end

end
