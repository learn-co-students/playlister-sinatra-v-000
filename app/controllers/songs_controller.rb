class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @songs = Song.all
    erb :'/songs/new'
  end

  post '/songs/' do
    @song = Song.create(params)
    if !params["artist"]["name"].empty?
      @song.artists << Artist.create(name: params["artist"]["name"])
    end
    @song.save
    redirect to "/songs/#{@song.id}"
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
    @song.name = params([:name])
    @song.artist = params([:artist])
    @song.genre = params([:genre])
    @song.save
    redirect to '/songs/:slug'
  end
  #DON'T FORGET TO ADD HIDDEN PATCH LINE TO ERB FILE!!!!!!!

end
