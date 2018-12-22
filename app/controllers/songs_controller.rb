require "pry"
class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'songs/index' 
  end
  
  get '/songs/new' do 
    @genres = Genre.all
    erb :'/songs/new'
  end
  
  post '/songs' do 
    #binding.pry
    @song = Song.create(name: params["Name"])
    if !params["Artist Name"].empty?
      if Artist.all.find{|artist| artist.name == params["Artist Name"]}
        @song.artist = Artist.all.find{|artist| artist.name == params["Artist Name"]}
        @song.save
      else 
        artist = Artist.create(name: params["Artist Name"])
        @song.artist = artist
        @song.save
      end
    end
    redirect to "/songs/#{@song.slug}"
  end
  
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end
end
