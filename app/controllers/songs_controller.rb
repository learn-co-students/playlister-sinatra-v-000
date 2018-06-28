require 'rack-flash'

class SongsController < ApplicationController
use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    if @artist = Artist.find_by_slug(params[:song][:artist].gsub(" ", "-").downcase)
    else
      @artist = Artist.create(name: params[:song][:artist])
    end
    params[:song][:artist] = @artist
    @song = Song.create(params["song"])
    flash[:message] = "Successfully created song."
    redirect to "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    if !params[:song][:artist].empty?
      if artist = Artist.find_by_slug(params[:song][:artist].gsub(" ",  "-").downcase)
      else
        artist = Artist.create(name: params[:song][:artist])
      end
      params[:song][:artist] = artist
      @song.artist = params[:song][:artist]
    end
    @song.genre_ids = params[:song][:genre_ids]
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

end
