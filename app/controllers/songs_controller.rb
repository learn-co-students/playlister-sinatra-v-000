class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    @song = params[:slug].find_by_slug
    erb :'/songs/show'
  end
  
end # SongsController
