class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :"songs/new"
  end

  post '/songs' do
    @song = Song.create(name: params["Name"])
    @artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.artist = @artist
    @song.genre_ids = params[:genres]
    @song.save
    @songs = Song.all
    erb :"songs/index", locals: {message: "Successfully created song."}
  end

  get '/songs/:slug' do   
    @song = Song.find_by_slug(params[:slug])
    puts @song.genres
    puts "123"
    erb :"songs/show"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/edit"
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.artist.name = params["Artist Name"]
    @song.genre_ids = params[:genres]
    @song.save
    erb :"songs/show", locals: {message: "Song successfully updated."}
  end

end