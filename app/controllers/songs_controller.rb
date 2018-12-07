class SongsController < ApplicationController

  get '/songs' do
     @songs = Song.all
     erb :'/songs/index'
   end

   get '/songs/new' do
     erb :'/songs/new'
   end

   post '/songs' do
     redirect to "songs/#{@song.id}"
   end

   get '/songs/:slug' do
     @song = Song.find_by_slug(params[:slug])
     @artist = @song.artist.name
     erb :'/songs/show'
   end

   patch '/songs/:id' do
     @song = Song.find(params[:id])
     @song.update(params["song"])
     if !params["artist"]["name"].empty?
       @song.artist = artist.create(name: params["artist"]["name"])
     end
     @song.save
     redirect "songs/#{@song.id}"
   end

   get '/songs/:id/edit' do
     @song = Song.find_by_id(params[:id])
     erb :'/songs/edit'
   end


end
