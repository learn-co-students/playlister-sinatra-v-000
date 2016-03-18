class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :"songs/new"
  end

  post '/songs' do
    @song = Song.create(params[:song])
    if !params["artist_name"].empty?
      @song.artist = Artist.new(name: params["artist_name"])
    end
    if !params["genre_name"].empty?
      @song.genres << Genre.new(name: params["genre_name"])
    end
    @song.save
    erb :"songs/show", locals: {message: "Successfully created song."}
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    @genres = @song.genres
    erb :"songs/show"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @artists = Artist.all
    @genres = Genre.all
    @songgenres = SongGenre.find_by(song_id: @song.id)
    erb :"songs/edit"
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    if !params["artist_name"].empty?
      @song.artist = Artist.new(name: params["artist_name"])
    end
    if !params["genre_name"].empty?
      @song.genres << Genre.new(name: params["genre_name"])
    end
    @song.save
    erb :"songs/show", locals: {message: "Song successfully updated."}
  end
end