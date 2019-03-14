class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all

    erb :"songs/index"
  end

  get 'songs/new' do
    erb :'songs/new'
  end

  post 'songs/new' do

  end

  get 'songs/:slug/edit' do
  end
end
