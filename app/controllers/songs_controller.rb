class SongsController < ApplicationController


  get '/songs' do
    @songs = Song.all

    erb :'songs/index'
    # @songs = Song.all
  end

end
