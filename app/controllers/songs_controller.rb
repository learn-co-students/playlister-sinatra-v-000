require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
      artist = Artist.find_or_create_by(name: params[:artist])
      @song = Song.create(params[:song])
      @song.artist = artist
      @song.save
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

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(genre_ids: params[:song][:genre_ids])
    if !params[:song][:artist_name].empty?
      artist = Artist.find_or_create_by(name: params[:song][:artist_name])
      @song.update(artist: artist)
    end
      @song.save
      flash[:message] = "Successfully updated song."
      redirect to "songs/#{@song.slug}"
    end


  end
