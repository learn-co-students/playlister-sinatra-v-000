class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do

  end

  post '/songs' do

  end

  get '/songs/:slug/:edit' do

  end

  get 'songs/:slug' do

  end

  post 'songs/:slug' do

  end
end
