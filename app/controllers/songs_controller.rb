class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    @artists = Artist.all
    @genres = Genre.all
    erb :index
  end
end
