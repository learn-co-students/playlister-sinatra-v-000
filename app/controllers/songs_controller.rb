class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all

    erb :'/songs/index'
  end

  get '/songs/new' do
    @songs = Song.all
    erb :'/songs/new'
  end

  post '/songs/new' do
    @song = Song.fing_by(name: params[:Name])
    if @song == nil
      @song = Song.create(name: params[:Name])
    end

    @artist = Artist.find_by(name: params["Artist Name"])
    if @artist != nil
      @song.artist = @artist
    else
      @artist = Artist.create(name: params["Artist Name"])
      @song.artist = @artist
    end

    @genres = Genre.all
    @genres.each do |a|
      SongGenre.create(genre_id: a, song_id: @song.id)
    end
    redirect_to("/songs/#{@song.slug}")
  end


  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    erb :'/songs/edit'
  end


  post '/songs/:slug/edit' do
    @song = Song.find_by(name: params[:Name])
    @song.name = params[:Name]

    @artist = Artist.find_by(name: params["Artist Name"])
      if @artist != nil
        @song.artist = @artist
      else
        @artist = Artist.create(name: params["Artist Name"])
        @song.artist = @artist
      end

    @genres = Genre.all
    @genres.each do |a|
      SongGenre.create(genre_id: a, song_id: @song.id)
    end
    redirect to("/songs/#{@song.slug}")
  end
end
