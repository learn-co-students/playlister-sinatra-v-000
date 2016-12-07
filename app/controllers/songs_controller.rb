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
    @songs = Song.find_by_slug(params[:slug])
    
    erb :'/songs/show'
  end



  post '/songs/new' do 
    
    @new_song = Song.create(:name => params[:song][:name])
    
    @new_song.artist = Artist.find_or_create_by(:name => params[:artist][:name])
    #binding.pry
    @new_song.genre_id = params[:genres][0]
    @new_song.save

    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@new_song.slug}")



  end


  get '/songs/:id/edit' do



  end


end


