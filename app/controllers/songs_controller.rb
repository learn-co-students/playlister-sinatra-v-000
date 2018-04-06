class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all

    erb :'songs/index'
  end

  get '/songs/:slug' do
    @songs = Song.all

    erb :'songs/show'
  end

  get '/songs/new' do
    @artists = Artist.all

    erb :'songs/new'
  end

end
