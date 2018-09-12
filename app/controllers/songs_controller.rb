require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash
  
  get '/songs' do
    @songs = Song.all
    #binding.pry
    erb :'songs/index'
  end
  
  get '/songs/new' do
    @songs = Song.all
    erb :'songs/new'
  end
  
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end
  
  post '/songs' do
    @song = Song.create(name: params[:Name])
    @song.artist = Artist.find_or_create_by(name: params[:Artist_Name])
    #binding.pry
    @song.genre_ids = params[:genres]
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end
  
  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end
  
  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    if params["Name"]
      @song.update(name: params["Name"])
    elsif params["Artist Name"] 
      @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    elsif params["genres"] 
      @song.update(genre_ids: params["genres"])
    end
    @song.save
    #binding.pry
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end
  
  

end