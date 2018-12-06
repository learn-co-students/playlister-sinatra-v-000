class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    if !params["artist_name"].empty?
      @artist = Artist.create(name: params["artist_name"])
      @artist.songs << @song
    end
    redirect to "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    #binding.pry
    erb :'/songs/show'
  end


end
