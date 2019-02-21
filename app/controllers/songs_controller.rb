class SongsController < ApplicationController
require 'pry'
  get '/songs' do
    @songs = Song.all
    erb :'song/index'
  end

  get '/songs/new' do
    erb :'song/new'
  end

  post '/songs' do
    @song = Song.create(name: params[:song][:name])
    @song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
    @song.genre_ids = params[:genres]
    @song.save
    redirect to "/songs/#{@song.slug}"

  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'song/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully updated song."
    redirect("/songs/#{@song.slug}")
  end



end
