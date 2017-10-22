class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/show'
  end

  get '/songs/:slug' do
    #binding.pry 
    erb :'/songs/:slug'
  end

end
