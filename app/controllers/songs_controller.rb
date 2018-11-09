class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    binding.pry
  end
end
