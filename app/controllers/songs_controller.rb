require 'sinatra/base'
require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get "/songs" do
    @songs = Song.all
    erb :'songs/index'
  end

  get "/songs/new" do
    erb :'songs/new'
  end

  post "/songs" do
    new_artist = Artist.find_or_create_by(:name => params["Artist Name"])
    new_song = Song.new(:name => params["Name"])
    new_song.artist = new_artist
    new_song.genre_ids = params[:genres]
    new_song.save

    flash[:message] = "Successfully created song."
    redirect "/songs/#{new_song.slug}"
  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end


  get "/songs/:slug/edit" do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  post "/songs/:slug" do
    song = Song.find_by_slug(params[:slug])
    song.update(params["Name"])
    song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    song.genre_ids = params[:genres]
    song.save

    flash[:message] = "Updated song!"
    redirect "/songs/#{song.slug}"
  end


end
