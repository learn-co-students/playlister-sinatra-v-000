class SongsController < ApplicationController

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
    flash.now[:message] = "Successfully created song."
    redirect_to "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post '/songs/:slug/edit' do
    artist = Artist.find_or_create_by(name: params[:artist])
    @song = Song.find_by_slug(params[:slug])
    @song.save
    flash.now[:message] = "Successfully updated song."
    redirect_to "songs/#{@song.slug}"
  end

end
