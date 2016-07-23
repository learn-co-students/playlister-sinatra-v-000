class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs/new' do
    @song = Song.create(params["Name"])
    @song.genre_ids = params["genres"]

    artist = Artist.find_or_create_by(params["Artist Name"])
    @song.artist = artist
    @song.save
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end


end
