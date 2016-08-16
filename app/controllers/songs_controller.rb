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

  post '/songs' do
    @song = Song.create(:name => params["Name"]) 
    @artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.genre_ids = params[:genres]
    # WHY DOES SONG HAVE GENRE_IDS IF IT'S HAS MANY; HOW CAN IT BE HAS_MANY AND NOT BELONGS_TO
    # BECAUSE IT'S A MANY TO MANY RELATIONSHIP?
    @song.artist = @artist
    @song.save 
    flash[:message] = "Successfully created song."
    redirect("/songs/#{@song.slug}")
  end 

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug]) 
    erb :'songs/edit'
  end 

  patch "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.save 
    flash[:message] = "Successfully updated song."
    redirect("/songs/#{@song.slug}")

  end 
   
end 