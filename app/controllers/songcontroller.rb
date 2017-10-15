class SongController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/songlist'
  end

  get '/songs/:slug' do
    @song = Song.all
    erb :'songs/show'
  end

end
