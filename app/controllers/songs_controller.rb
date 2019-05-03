class SongsController < ApplicationController
  
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end
  
  get '/songs/:slug' do
    #binding.pry
    @song = Song.find_by_slug(params[:slug])
  end
end