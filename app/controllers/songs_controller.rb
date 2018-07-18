class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    redirect to "/songs/#{@song.id}"
  end

  get '/songs/:slug' do

  end

  get '/songs/:slug/edit' do

  end

end
