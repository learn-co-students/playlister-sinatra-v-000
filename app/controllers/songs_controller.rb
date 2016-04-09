class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    Artist.find_or_create_by(params[:artist]).songs << @song
    @song.genres = params[:genres]
    erb :'/songs/show', locals: {message: "Successfully created song."}
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
    @song.update(params[:song])
    Artist.find_or_create_by(params[:artist]).songs << @song
    @song.genres = params[:genres]
    erb :'/songs/show', locals: {message: "Song successfully updated."}
  end
end
