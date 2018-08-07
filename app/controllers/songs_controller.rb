class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :songs
  end

  get '/songs/:id' do
    @song = Song.find_by_id(params[:id])
    erb :show_song
  end
end
