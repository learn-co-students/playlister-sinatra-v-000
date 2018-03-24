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
  	erb :'songs/show' 
  end 

  post '/songs' do 
    #binding.pry
    @song = Song.create(:name => params["Name"])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save
    
    flash[:notice] = "Successfully created song."
    #binding.pry
    redirect to "/songs/#{@song.slug}" #, locals: {message: "Successfully created song."}
  end

  get "/songs/:slug/edit" do 
     @song = Song.find_by_slug(params[:slug])
     erb :'/songs/edit'
  end 

  patch "/songs/:slug" do 
  	@song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
  	#binding.pry
  	@song.artist = Artist.find_or_create_by(name: params["Artist Name"])
  	@song.genre_ids = params[:genres]
  	@song.save 

  	flash[:notice] = "Successfully updated song."
  	
  	redirect to "/songs/#{@song.slug}"
  end 



end 