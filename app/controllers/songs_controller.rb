require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash
  
  get "/songs" do 
    @songs = Song.all
    erb :"songs/index"
  end
  
  get "/songs/new" do
    @genres = Genre.all
    erb :"songs/new"
  end
  
  post "/songs" do 
    @song = Song.create(name: params[:song_name])
    @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    params[:genres].each {|genre_id| @song.genres << Genre.find_by_id(genre_id)}
    @song.save
    flash[:message] = "Successfully created song."
    redirect "songs/#{@song.slug}"
  end
  
  get "/songs/:slug" do 
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end
  
  get "/songs/:slug/edit" do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :"songs/edit"
  end
  
  patch "/songs/:slug" do 
    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:song_name]
    @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    if !@song.genres.empty?
      @song.genres = []
    end
    params[:genres].each {|genre_id| @song.genres << Genre.find_by_id(genre_id)}
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "songs/#{@song.slug}"
  end
  
end