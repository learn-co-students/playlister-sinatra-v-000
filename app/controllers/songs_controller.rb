require "sinatra/base"
require "rack-flash"
require "pry"

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    # list of all songs, each song w/ clickable link
    # "The Greatest"
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    # able to create new song, genres as checkboxes, able to enter 1 artist's name per song
    # "new song"
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params[:name])
    @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    @song.genre_ids = params[:genres]
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    # song's show page should have links for artist and each genre association
    # "testing"
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    # change everything about song inclding genres/artists associated
    # "edit me"
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

end
