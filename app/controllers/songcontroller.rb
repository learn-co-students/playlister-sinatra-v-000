class SongController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/songlist'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artists = @song.artists
    erb :'songs/show'
  end

end
