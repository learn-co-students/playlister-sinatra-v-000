class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
#    "Hello World"
    erb :'/songs/index'
  end

end
