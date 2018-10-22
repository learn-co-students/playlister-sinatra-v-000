class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    # @genre = Genre.find_by(song_id: @song) 
    erb :'/songs/show'
  end
end
