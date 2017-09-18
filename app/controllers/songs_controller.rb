class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/:slug' do

  end

  post '/songs' do
    #for creating new songs
  end

  get '/songs/:slug/edit' do

  end

  post '/songs/:slug' do
    #for updating a song
  end

end
