require 'rack-flash'
  
class SongsController < ApplicationController
  use Rack::Flash
  
  enable :sessions
  
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end 
  
  get '/songs/new' do 
    
    @genres = Genre.all
    erb :'songs/new'
  end 
  
  post '/songs' do 
    binding.pry
    genres = []
    @artist = Artist.find_or_create_by(name: params["song"]["name"])
    @song = Song.create(name: params[:song_name])
    @song.artist = @artist 
    @genre = Genre.find_or_create_by(name: params[:song][][:genre])
    @song.genre_id = @genre.id
    @song.save
    erb :'songs/show'
  end 
  
  get '/songs/:slug' do 
    
    @song = Song.find_by_slug(params[:slug])
    
    erb :'songs/show'
  end 
end