require_relative '../../app/models/song'

class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get 'songs/new' do

  end

  get 'songs/:slug' do

  end
end
