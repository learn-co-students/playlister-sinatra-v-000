require 'rack-flash'
class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    if !params["artist"]["name"].empty? #&& !Artist.find_by_slug(params["artist"]["name"].downcase.split(" ").join("-"))
      @song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
    end
    if !params["genre"]["name"].empty? #&& !Genre.find_by_slug(params["genre"]["name"].downcase.split(" ").join("-"))
      @song.genres << Genre.find_or_create_by(name: params["genre"]["name"])
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    if !params["artist"]["name"].empty? #&& !Artist.find_by_slug(params["artist"]["name"].downcase.split(" ").join("-"))
      @song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
    end
    if !params["genre"]["name"].empty? #&& !Genre.find_by_slug(params["genre"]["name"].downcase.split(" ").join("-"))
      @song.genres << Genre.find_or_create_by(name: params["genre"]["name"])
    end
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

end
