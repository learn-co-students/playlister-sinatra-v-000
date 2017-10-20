class SongsController < ApplicationController

  get '/songs' do 
    @songs = Song.all
    erb :'/songs/show'
  end

end
