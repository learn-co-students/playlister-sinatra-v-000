class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs' do
    artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song = Song.create(name: params["Name"], artist: artist)
    @song.genre_ids = params[:genre]
    @song.save

    erb :'songs/show', locals: {message: "Successfully created song."}
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    erb :'songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.update(name: params["Name"], artist: artist)
    @song.genre_ids = params[:genre]
    @song.save

    erb :"songs/show", locals: {message: "Song successfully updated."}
  end

end
