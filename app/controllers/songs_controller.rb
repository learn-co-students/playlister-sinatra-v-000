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
    if !params["Artist Name"].empty?
      @artist = Artist.create(name: params["Artist Name"])
      #@artist.save
      @song.artist = @artist
      @song.save
      #@artist.songs << @song
    end

    if !params["Genre Name"].empty?
      @genre = Genre.create(name: params["Genre Name"])
      #@genre.save
      @song.artist = @artist
      @song.save
      #@genre.songs << @song
    end
    @song.save
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

end
