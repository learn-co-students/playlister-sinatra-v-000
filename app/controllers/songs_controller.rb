class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end
  get '/songs/:slug' do
    # binding.pry
    @songs = Song.all
    erb :'/songs/:slug'
  end

end