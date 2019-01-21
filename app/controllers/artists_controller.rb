class ArtistsController < ApplicationController
  
  get "/artists/new" do
    @songs = Song.all
    @genres = Genre.all
    erb :'artists/new'
  end
end
