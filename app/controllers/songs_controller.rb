require 'sinatra/base'
require 'sinatra/flash'

class SongsController < ApplicationController

  enable :sessions
  register Sinatra::Flash

  get '/songs' do
    @song = Song.all
    erb  :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    song = Song.new(params[:song])
    artist = Artist.where(params[:artist]).first_or_initialize
    song.artist = artist
    song.save!

    flash[:message] = "Successfully created song."

    redirect "/songs/#{song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    song.assign_attributes(params[:song])
    artist = Artist.where(params[:artist]).first_or_initialize
    song.artist = artist
    song.save!

    flash[:message] = "Successfully updated song."
    redirect "/songs/#{song.slug}"
  end
end
