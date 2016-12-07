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
   # binding.pry

    erb :'/songs/new'
  end

  get '/songs/:slug' do
   # binding.pry
    @song = Song.find_by_slug(params[:slug])
    
    erb :'/songs/show'
  end

#


  post '/songs/new' do 
    @new_song = Song.create(:name => params[:song][:name])#, :genre => params[:genres])
    #if params[:name], get redirect errors - goes 
    #to songs/new instead of slug

    #if params[:song][:name], get create new song 
    #error / genre not displayed on page

    @artist = Artist.find_or_create_by(params[:artist])
    @artist.songs << @new_song
    @new_song.genre_ids << params[:genres]  
    #binding.pry
    @new_song.save

    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@new_song.slug}")

  end


  get '/songs/:id/edit' do


    erb :'/songs/show'

  end


end


