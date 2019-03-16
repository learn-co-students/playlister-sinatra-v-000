class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @songs = Song.all
    erb :'/songs/new'
  end

  post '/songs/new' do
    @song = Song.create(params[:song])
    
  end

  get '/songs/:slug' do

  end

end
