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
    binding.pry
    @song = Song.create(params[:song])
    if !params["artist_name"].empty?
      @artist = Artist.create(name: params["artist_name"])
      @artist.save
      @song.artist = @artist
      @song.save
      @artist.songs << @song
    end
    @song.save
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    binding.pry
    @song = Song.find_by_slug(params[:slug])
    erb :'/song/show'
  end

end
