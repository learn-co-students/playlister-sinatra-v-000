require "pry"
class SongsController < ApplicationController

  # Index action
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end



  # Create action
  get '/songs/new' do
    erb :'songs/new'
  end

  # Show action
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    @song = Song.create(name: params[:song_name])
    @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    @song.genre_ids = params[:genres] 
    @song.save

    erb :'songs/show', locals: {message: "Successfully created song."}
  end



  # Update action
  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    @song.genre_ids = params[:genres] 
    @song.save

    erb :'songs/show', locals: {message: "Song successfully updated."}

  end
  


end
