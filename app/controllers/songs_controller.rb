class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :index
  end




end