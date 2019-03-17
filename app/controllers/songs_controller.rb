class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all

    erb :'songs/index'
  end

  # get '/songs/new' do
  #   erb :'songs/new'
  # end
  #
  # post '/song' do
  #   @song = Song.create(params)
  # end
  #
  get '/songs/:slug' do
    @song = Song.all.find_by_slug(params[:slug])
    @artist = Artist.find_by(id: @song.artist_id)
    @genres = @song.genres
    erb :'songs/show'
  end
  #
  # get '/songs/:slug/edit' do
  #   erb :'songs/edit'
  # end

end
