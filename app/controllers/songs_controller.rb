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

    if !params["genre_name"].empty?
      @genre = Genre.create(name: params["genre_name"])
      @genre_name.save
      @song.artist = @artist
      @song.save
      @genre.songs << @song
    end
    @song.save
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/song/show'
  end

end
