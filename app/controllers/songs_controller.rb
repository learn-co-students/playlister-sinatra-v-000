class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    binding.pry
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
    erb :'songs/edit'
  end

  post '/songs/new' do
    @song = Song.create(params[:song])
    @song.genre_ids = params[:genres]
    if !params["artist"]["name"].empty?
      @song.artist = Artist.find_or_create_by_name(params["artist"]["name"])
    end
      @song.save
      redirect "songs/show/#{@song.slug}"
    end

  end
