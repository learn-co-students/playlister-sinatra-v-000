class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
      erb :'/songs/index'
  end


  get '/songs/:id' do

  end
end
