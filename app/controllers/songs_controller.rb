class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])

    if !params["artist"]["name"].empty?
      @song.artist = Artist.create(name: params["artist"]["name"])
    end

    @song.save
    redirect to "songs/#{@song.id}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end


end
