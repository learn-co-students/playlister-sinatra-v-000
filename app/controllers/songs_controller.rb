class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
  @song = Song.create(params["song"]["name"])
    if !params["artist"]["name"].empty?
      @song.artist = Artist.create(name: params["artist"]["name"])
    end
  @song.save
    flash[:message] = "Successfully created song"
    redirect "songs/#{@song.slug}"
  end

  get '/owners/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params["artist"])
    if !params["artist"]["name"].empty?
      @song.artist = Artist.create(name: params["artist"]["name"])
    end
    @song.save
    redirect to "songs/#{@song.slug}"
  end
end
