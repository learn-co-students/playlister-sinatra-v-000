class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:slug' do

  end

  get '/songs/new' do
    @genres = Genre.all
  end

end
