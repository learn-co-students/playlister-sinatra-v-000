require 'sinatra/base'
require 'rack-flash'


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

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do 
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end


  post '/songs/new' do 
    @new_song = Song.create(:name => params["Name"])

    @new_song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @new_song.genre_ids = params[:genres]  
    
    @new_song.save

    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@new_song.slug}")
  end


  post '/songs/:slug' do
    #binding.pry    
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    @song.save
    
    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end


end


