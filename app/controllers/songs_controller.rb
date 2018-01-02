require "rack-flash"

class SongsController < ApplicationController

   use Rack::Flash
    
   get '/songs' do
       erb :'/songs/index'
   end
   
   get '/songs/new' do
      erb :'/songs/new'
   end
   
   post '/songs' do
      @song = Song.create(name: params[:name])
         if Artist.find_by(name: params[:artist])
            @song.artist = Artist.find_by(name: params[:artist])
         else
            @artist = Artist.create(name: params[:artist])
            @song.artist = @artist
         end
      @genre = Genre.find(params[:genres])
      @song.genres << @genre
      @song.save
      flash[:message] = "Successfully created song."
      redirect to("/songs/#{@song.slug}")
   end
   
   get '/songs/:slug/edit' do 
      @song = Song.find_by_slug(params[:slug])
      erb :'/songs/edit'
   end
   
   get '/songs/:slug' do 
      @song = Song.find_by_slug(params[:slug])
      @artist = @song.artist
      erb :'/songs/show'
   end
   
   post '/songs/:slug' do
      
   end
end