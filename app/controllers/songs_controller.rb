class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end
  post '/songs' do
    @song = Song.create(name: params[:song][:name])
    @song.artist = Artist.find_or_crate_by(name: params[:artist][:name])
    @song.genres = params[:genres]
    @song.save
    erb :"songs/show", {message: "Successfully created song."}
  end
  get '/songs/new' do
    erb :"songs/new"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/edit"
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    if !(params[:artist][:name]).empty?
      @song.artist = Artist.find_or_crate_by(name: params[:artist][:name])
    end
    @song.save
    erb :'songs/show', locals: {message: "Successfully created song."}
  end

end