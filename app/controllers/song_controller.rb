require 'rack-flash'
require "rack/flash/test"

class SongController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
  
    erb :'/songs/new'
  end

  post '/songs' do
    artist = Artist.find_or_create_by(name: params[:song][:artist_name])
    song = Song.create(name: params[:song][:name], artist: artist)
    song.genre_ids = params[:song][:genres]
    song.save

    flash[:message] = "Successfully created song."
    redirect "/songs/#{song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @genres = Genre.all
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    artist = Artist.find_or_create_by(name: params[:song][:artist_name])
    song.update(name: params[:song][:name], artist: artist)
    song.genre_ids = params[:song][:genres]
    song.save
    
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{song.slug}"
  end

end