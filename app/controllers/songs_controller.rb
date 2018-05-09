require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash
  
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end
  
  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end
  
  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    session[:song_id] = @song.id
    erb :'/songs/edit'
  end
  
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end
  
  post '/songs' do
    song_artist = Artist.find_or_create_by(params[:artist])
    new_song = Song.create(params[:song])
    new_song.artist = song_artist
    song_artist.songs << new_song
    song_artist.save
    new_song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{new_song.slug}"
  end
  
  patch '/songs' do
    current_song = Song.find(session[:song_id])
    
    #updates genres
    current_song.update(params[:song])
    song_artist = Artist.find_or_create_by(params[:artist])
    
    #updates artist
    current_song.artist = song_artist
    song_artist.songs << current_song
    song_artist.save
    current_song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{current_song.slug}"
  end
  
end
