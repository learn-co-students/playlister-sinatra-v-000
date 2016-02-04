class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
	binding.pry
    erb :'/songs/index'
  end

end
