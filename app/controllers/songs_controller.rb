class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
  end

end
