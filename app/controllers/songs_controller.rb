require 'sinatra/base'
require 'rack-flash'

class SongsController < ApplicationController

  enable :sessions
  use Rack::Flash
  
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end
  
  get '/songs/new' do
    @genres = Genre.all
    @artists = Artist.all
    erb :'/songs/new'
  end
 
  post '/songs' do
    @song = Song.create(params[:song])
    @song.save
    if !params["genre"]["name"].empty?
      genre = Genre.find_or_create_by(name: params["genre"]["name"])
      @song.genre_id = genre.id
      @song.genre = genre
    end
    if !params["artist"]["name"].empty?
      artist = Artist.find_or_create_by(name: params["artist"]["name"])
      @song.artist_id = artist.id
      @song.artist = artist
    end
    @song.save
    @song.song_genres.create(genre: genre)
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end
  
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @genres = Genre.all
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end
  
  patch '/songs/:slug' do
    @song = Song.find(params[:id])
    @song.update(params["artist"])
    if !params["artist"]["name"].empty?
      artist = Artist.find_or_create_by(name: params["artist"]["name"])
      @song.artist_id = artist.id
      @song.artist = artist
    end
    if !params["genre"]["name"].empty?
      genre = Genre.find_or_create_by(name: params["genre"]["name"])
      @song.genre_id = genre.id
      @song.genre = genre
    end
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

end