class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :songs
  end

  get '/songs/new' do
    erb :new_song
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :song
  end

  get '/songs/:slug/edit' do
    erb :edit_song
  end

  post '/songs/new' do
    @song = Song.create(params[:song])
    @song.genre_ids = params[:genres]
    if !params["artist"]["name"].empty?
      @song.artist = Artist.find_or_create_by_name(params["artist"]["name"])
    end
      @song.save
      redirect "/songs/#{@song.slug}"
    end

  end
