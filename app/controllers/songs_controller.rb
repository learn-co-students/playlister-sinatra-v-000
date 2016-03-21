class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :songs
  end

  get '/songs/:slug' do
    @song = Song.all
    erb :'/songs/show'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

end
