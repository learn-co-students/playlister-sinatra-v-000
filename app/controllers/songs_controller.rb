class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end

  get '/songs/new' do
    erb :"songs/new"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    @song = Song.new(name: params[:name])
    @artist = Artist.find_or_create_by(name: params[:artist_name])
    @song.artist = @artist
    @song.genre_ids = params[:genres]
    @song.save
    erb :'songs/show', locals: {message: "Successfully created song."}
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/edit"
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_or_create_by(name: params[:artist_name])
    @song.artist = @artist
    @song.genre_ids = params[:genres]
    @song.save
    erb :'songs/show', locals: {message: "Song successfully updated."}

  end

end
