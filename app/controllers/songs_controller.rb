require 'rack-flash'
class SongsController < ApplicationController

  enable :sessions
  use Rack::Flash

  get '/songs' do 
    @songs = Song.all
    erb :'songs/index'    
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    @song = Song.create(name: params["Name"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do 
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  post '/songs/:slug' do 
    @song = Song.find_by_slug(params[:slug])
    @song.update(name: params["Name"])
    @song.artist.update(name: params["Artist Name"])
    @song.genres = Song.update_genres(params)
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

end