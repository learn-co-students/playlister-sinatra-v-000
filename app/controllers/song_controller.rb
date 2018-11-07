class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/views/song.rb'
  end
end
