class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :new
  end

  post '/songs' do
    @song = Song.find(params[:id])
    @song.name
  end
  
  get '/songs/:id' do 
    erb :show 
  end

end
