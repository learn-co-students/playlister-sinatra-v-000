class SongsController < ApplicationController

  get '/songs' do
    "Hello World"
    @songs = Song.all
    erb :'/songs/index'
  end
end
