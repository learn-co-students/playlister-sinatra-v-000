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
    @song = Song.find_or_create_by(name: params["Name"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genre_ids = params[:genres]
    #binding.pry
    @song.update(params[:song])
    @song.save

    erb :'/show', :locals => {:name => "Successfully created song."}
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.update(params[:song])
    @song.save

    erb :'songs/show', locals: {message: "Song successfully updated."}
  end

end