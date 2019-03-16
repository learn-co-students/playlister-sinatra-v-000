class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @songs = Song.all
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    if !params["artist_name"].empty?
      @artist = Artist.create(name: params["artist_name"])
      @artist.save
      @song.artist = @artist
      @song.save
      @artist.songs << @song
    end
    @song.save
    redirect to "/songs/#{@song.name.slug}"
  end

  get '/songs/:slug' do

  end

end
