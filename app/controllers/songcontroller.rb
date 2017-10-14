class SongController < ApplicationController

  get '/songs' do
    @songs = Song.all
    puts @songs.first.name
    erb :'songs/songlist'
  end

end
