require 'rack-flash'

class SongsController < ApplicationController
   enable :sessions
   use Rack::Flash

   get '/songs' do 
        @songs = Song.all
        erb :'song/songs'
   end 

   get '/songs/new' do 
     erb :'song/new'
   end

   get '/songs/:slug' do 
        @song = Song.find_by_slug(params[:slug])
        erb :'song/show'
   end

   post '/songs' do 
     @song = Song.create(name: params[:Name])
     @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
     @song.genre_ids = params[:genres]
     @song.save

     flash[:message] = "Successfully created song."

     redirect("/songs/#{@song.slug}")
   end

   get '/songs/:slug/edit' do 
      @song = Song.find_by_slug(params[:slug])
      erb :'song/edit'
   end

   patch '/songs/:slug' do 
      @song = Song.find_by_slug(params[:slug])
      @song.update(params[:song])
      @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
      @song.genre_ids = params[:genres]
      @song.save

      flash[:message] = "Successfully updated song."
      redirect "/songs/#{@song.slug}"
   end
end    