class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs' do
    @artist = Artist.find_or_create_by(name: params["artist"])
    @song = Song.create(name: params["name"], genre_ids: params["genre_ids"])
    @song.artist = @artist
    if !params["genre_name"].empty?
      @song.genres << @genre = Genre.find_or_create_by(name: params["genre_name"])
    end
    @song.save
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @artist = Artist.find_or_create_by(name: params["artist"])
    @song = Song.find_by_slug(params[:slug])
    @song.update(name: params[:name], artist: @artist, genre_ids: params["genre_ids"])
    if !params["genre_name"].empty?
      @song.genres << @genre = Genre.find_or_create_by(name: params["genre_name"])
    end
    @song.save
    redirect to "/songs/#{@song.slug}"
  end

  delete '/delete/:slug' do
    redirect to '/songs'
  end
end
