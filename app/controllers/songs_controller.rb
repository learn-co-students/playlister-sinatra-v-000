class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get 'songs/new' do

  end

  get '/songs/:slug' do
    @songs = Song.all
    erb :'/songs/show'
  end


end
