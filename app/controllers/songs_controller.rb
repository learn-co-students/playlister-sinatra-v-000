class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
   erb :'/songs'
  end

  get 'songs/new' do
    @artists = Artist.all
   erb :'/songs/new'
  end

end
