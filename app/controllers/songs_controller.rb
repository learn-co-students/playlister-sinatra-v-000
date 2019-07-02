require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash
  enable :sessions

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(:name => params["Name"])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.genre_ids = params[:Genres]
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    #edit song attibutes here
    #@song.name = params[:Name]
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.genre_ids = params[:Genres]
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end


end
