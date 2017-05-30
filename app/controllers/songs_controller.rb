class SongsController < ApplicationController
  get '/songs' do
    erb :"songs/index"
  end

  post '/songs' do
    song = Song.new(params[:song])
    artist = Artist.find_by(name: params[:artist_name])
    artist.nil? ? song.artist = Artist.create(name: params[:artist_name]) : song.artist = artist
    song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{song.slug}"
  end

  get '/songs/new' do
    erb :"songs/new"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/edit"
  end

  post '/songs/:slug/edit' do
    song = Song.find_by_slug(params[:slug])
    song.update(params[:song])
    artist = Artist.find_by(name: params[:artist_name])
    artist.nil? ? song.artist = Artist.create(name: params[:artist_name]) : song.artist = artist
    song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{song.slug}"
  end

end
