class SongController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/songlist'
  end

  get '/songs/:slug' do
    erb :'songs/show'
  end

end
