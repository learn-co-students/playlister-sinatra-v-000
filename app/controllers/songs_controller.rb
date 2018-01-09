
require 'rack-flash'
require "rack/flash/test"

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    if !params["Name"].empty? && !params["Artist Name"].empty?
      @song = Song.find_or_create_by(name: params["Name"])
      @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
      @song.genre_ids = params[:genres]
      @song.save
      flash[:message] = "Successfully created song."
      redirect to "/songs/#{@song.slug}"
    else
      erb :'songs/error'
    end


  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.artist = Artist.find_or_create_by(name: params["Artist"])
    @song.genre_ids = params[:genres]
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

end
