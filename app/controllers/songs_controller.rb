class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/song/index'
  end
end
