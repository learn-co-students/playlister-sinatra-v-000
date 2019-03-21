class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :index
  end

  get '/songs/new' do
    erb :new
  end

  post '/songs' do
    @song = Song.find(params[:id])
    @song.name
  end

end
