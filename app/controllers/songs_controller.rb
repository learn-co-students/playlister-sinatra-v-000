class SongsController < ApplicationController

  # New

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find(params[:slug])
    erb :'/songs/:slug'
  end

end
