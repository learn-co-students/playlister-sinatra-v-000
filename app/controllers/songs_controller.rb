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
  
end
