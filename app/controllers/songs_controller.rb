require 'pry'

class SongsController < ApplicationController


     get '/songs' do
      @songs = Song.all
      # model name followed by a method
      erb :'/songs/index'
    end

    get '/songs/new' do
       @genres = Genre.all
       @artists = Artist.all
      erb :'/songs/new'
    end



   post '/songs' do
 #create a new artist
 @song = Song.create(params[:Name])
   if !params[:artist][:name].empty?
     @song.artists << Artist.create(name: params[:artist][:name])
   end
   if !params[:song][:genre_ids].empty?
        @song.genre_ids = params[:song][:genre_ids]
   end
       @song.save
    redirect to "/songs/:slug"

    end

    get '/songs/:slug' do
     @song = Song.find_by_slug(params[:slug])  # slug helps to find by name instaed of ID
     # model name followed by a method
     erb :'/songs/show'
    end

end #end for class method
