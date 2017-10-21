class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/songs'
  end

  get '/songs/new' do 
    erb :'/songs/new'
  end

  get '/songs/:slug' do 
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do 
    @song = Song.create(name: params["Name"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save
    erb :'/songs/show', :locals => {:name => "Successfully created song."}
  end

  get '/songs/:slug/edit' do 
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post '/songs/:slug' do 
    @song = Song.find_by_slug(params[:slug])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save
    erb :'/songs/show', :locals => {:name => "Song successfully updated."}
  end

end