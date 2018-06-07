class SongsController < ApplicationController

  get '/songs' do

    @songs = Song.all

    erb :'/songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @genres = @song.song_genres
    @artist = @song.artist
    # binding.pry
    erb :'/songs/show'
  end


end
