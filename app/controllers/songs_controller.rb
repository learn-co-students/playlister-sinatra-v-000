class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs/new' do
    @song = Song.create(name: params[:name])
    @song.genre_ids = params[:genres]
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.save
    flash[:message] = "Successfully created song."
    redirect "songs/#{@song.slug}"
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
      @song.artist = params["Artist Name"]
      @song.genres = params[:genres]
      @song.update
      redirect "songs#{@song.slug}"
    end

  end
