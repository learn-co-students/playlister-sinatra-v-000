require 'pry'

class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_by_id(@song.artist_id)
    erb :'/songs/show'
  end

  post '/songs' do
    @song = Song.create(params["Name"])
    @song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
    @song.genre_ids = params[:genres]
    @song.save
    redirect to "/songs/#{@song.slug}"
  end

end
