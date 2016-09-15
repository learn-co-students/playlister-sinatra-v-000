require 'pry'
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

    erb :'/songs/show'
  end

  post '/songs' do 

   @song = Song.create(name: params[:name]) 
 
    if !params[:artist][:name].empty?
      @song.artist = Artist.find_or_create_by(:name => params[:artist][:name])
    end
      
    params["genres"].each do |id|
        @song.genres << Genre.find(id)
    end

    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}" 
  end

  get '/songs/:slug/edit' do 
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end


#need to figure out how to get the genre to properly update

  post '/songs/:slug' do 

    @song = Song.find_by_slug(params[:slug])  # finds your original artist 
    
    #update the song name
    if !params[:name].empty? # if this is not empty - we're renaming the song
      @song.name = params[:name]
    end
    
    @song.genres.clear # wipe the old genres, update below with whatever is in params
    params["genres"].each do |id|
        @song.genres << Genre.find(id)
    end  # adding all the genres selected to the songs genres

    if !params[:artist][:name].empty? # if the create a new artist is not empty and the checkbox is unchecekd we're renaming the song to the brand new artist
      @song.artist = Artist.create(name: params[:artist][:name])
    else
      @song.artist = Artist.find(params[:artists]).first
    end
    @song.save 

    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}" 
  end


  
end
