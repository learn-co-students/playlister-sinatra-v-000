require 'sinatra/base'
require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end


  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    #binding.pry
    erb :'/songs/show'
  end


  post '/songs' do
    @song = Song.create(params[:song])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save
    #binding.pry
    flash[:message] = "Successfully created song."

    redirect to "songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
  @song = Song.find_by_slug(params[:slug])
  erb :'/songs/edit'
  end

  patch '/songs/:slug' do

  @song = Song.find_by_slug(params[:slug])
  #binding.pry
  @song.update(params[:song])
  #binding.pry
  @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
  @song.genre_ids = params[:genres]
  @song.save
  #binding.pry
  flash[:message] = "Successfully updated song."
  redirect "songs/#{@song.slug}"
  end




end
