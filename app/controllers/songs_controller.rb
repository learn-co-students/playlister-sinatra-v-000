require 'pry'

class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :songs 
  end

  get '/songs/new' do
    @genres = Genre.all
    
    erb :new_song  #to be refactored later
  end

  get '/songs/:slug' do 
    @song = Song.find_by(name: Song.find_by_slug(params[:slug]).name)
    erb :show_songs
  end

  post '/songs' do
   @song = Song.new
   @song.name = params[:name]
   @artist = params["Artist Name"]
   @song.artist = @artist
   @song.genres << params[:genres]
   @song.save
   redirect '/songs'
  end

  get "/songs/:slug/edit" do
    @genres = Genre.all
    @song = Song.find_by(name: Song.find_by_slug(params[:slug]).name)
    erb :'songs/edit.html'
  end

  post "/songs/:slug" do 
    @song = Song.find_by(name: Song.find_by_slug(params[:slug]).name)
    @song.artist = params["Artist Name"]
    @song.save
    redirect '/songs/#{@song.slug}'
  end
end