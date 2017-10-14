class SongController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/songlist'
  end

end
