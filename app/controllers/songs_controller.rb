class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  post '/songs' do
     @song = Song.create(name: params["Name"])
     @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
     @song.genre_ids = params[:genres]
     @song.save
     erb :'songs/show', locals: {message: "Successfully created song."}
   end

  post '/songs/:slug' do
    params.to_s
    @song = Song.find_by_slug(params[:slug])
    @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    @song.genre_ids = params[:genres]
    @song.save
    erb :'/songs/show', locals: {message: "Song successfully updated."}
  end
end