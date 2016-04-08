class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    redirect :"/songs/#{@song.id}"
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:id' do
    @song = Song.find(params[:id])
    erb :'/songs/show/'
  end

  get '/songs/:id/edit' do
    @song = Song.find(params[:id])
    erb :'/songs/edit'
  end

  post '/songs/:id' do
    @song = Song.find(params[:id])
    if song
      @song.update(params[:song])
    end
    redirect :"/songs/#{@song.id}"
  end
end