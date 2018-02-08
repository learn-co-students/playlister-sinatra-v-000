require 'sinatra/flash'

class SongsController < ApplicationController
  register Sinatra::Flash

  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end

  get '/songs/new' do
    erb :"songs/new"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end

  post '/songs' do
    @song = Song.new(:name => params["name"])
    @artist = Artist.find_or_create_by(:name => params["artist_name"])
    @song.artist = @artist
    params["genre_ids"].each do |id|
      @song.genres << Genre.find(id)
    end
    @song.save
    flash.next[:message] = "Successfully created song."
    redirect :"/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    erb :"songs/edit"
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.name = params["name"]
    @artist = Artist.find_or_create_by(:name => params["artist_name"])
    @song.artist = @artist
    @song.genres.clear
    params["genre_ids"].each do |id|
      @song.genres << Genre.find(id)
    end
    @song.save
    flash.next[:message] = "Successfully updated song."
    redirect :"/songs/#{@song.slug}"
  end

end
