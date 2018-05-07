require 'sinatra/base'
require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash


  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end


  get '/songs/new' do
  @genres = Genre.all
  @artists = Artist.all
    erb :'songs/new'
  end

  post '/songs' do
    #... code for creating song
    @song = Song.create(name: params[:name])
    @song.artist = Artist.find_or_create_by(name: params[:artist])
    @song.genre_ids = params[:genres]
    @song.save
    # binding.pry
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end


  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end


  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/edit"
  end

  patch '/songs/:slug' do
     @song = Song.find_by_slug(params[:slug])
    #  binding.pry
     @song.update(params[:song])
     @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
     @song.genre_ids = params[:genres]
     @song.save
      # params["Artist Name"] params["Name"]
    #  @song.Update(artist: params[:name], artist: params)
     flash[:message] = "Successfully updated song."
     redirect "songs/#{@song.slug}"
  end

end
