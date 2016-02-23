class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @songs = Song.create(name: params["Name"])
    @songs.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @songs.genre_ids = params[:genres]
    @songs.save
    erb :'/show' 
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do 
    @songs = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post '/songs/:slug' do 
    @songs = Song.find_by_slug(params[:slug])
    @songs.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @songs.genre_ids = params[:genres]
    @songs.save
    erb :'/songs/show'
  end
end