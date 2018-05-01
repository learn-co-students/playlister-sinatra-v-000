require 'rack-flash'

      
class SongsController < ApplicationController

use Rack::Flash
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  post '/songs' do
    @song = Song.find_or_create_by(name: params[:song][:name])
    @artist = Artist.find_or_create_by(name: params[:song][:artist])
    @song.artist = @artist
    params[:genres].each do |genre|
      @genre = Genre.find_by(name: genre)
      @song.genres << @genre
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/new' do
    erb :'/songs/new'
  end
  
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    @genres = @song.genres
    erb :'/songs/show'
  end
  
  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end
  
  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.artist = Artist.find_or_create_by(name: params[:song][:artist])
    @song.update(name: params[:song][:name])
    @song.genres.clear
    params[:genres].each do |genre|
      @genre = Genre.find_by(name: genre)
      @song.genres << @genre
    end
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end
end
