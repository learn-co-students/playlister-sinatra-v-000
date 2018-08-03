class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    @songs = Song.all
    erb :'/songs/show'
  end

  get 'songs/new' do

  end

end
