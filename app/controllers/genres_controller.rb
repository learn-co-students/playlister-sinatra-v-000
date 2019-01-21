class GenresController < ApplicationController
  
  get "/genres/new" do
    @songs = Song.all
    @genres = Genre.all
    erb :'genres/new'
  end
  
end