class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @songs = Song.all
    @artists = Artist.all
    @genres = Genre.all
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    @song = Song.create(params['song'])
    if !params["artist"]["name"].empty?
      @song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
    end
    @song.genre_ids = params['genre']
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @songs = Song.all
    @artists = Artist.all
    @genres = Genre.all
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.update(params['song'])
    if !params["artist"]["name"].empty?
      @song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
    end
    @song.genre_ids = params['genre']
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

end
