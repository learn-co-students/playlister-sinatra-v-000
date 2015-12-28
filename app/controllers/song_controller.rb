class SongController < ApplicationController

  get '/songs' do
    @songs = Song.all.sort_by(&:name)
    erb :'songs/index'
  end

  get '/songs/:slug' do
    
  end
end
