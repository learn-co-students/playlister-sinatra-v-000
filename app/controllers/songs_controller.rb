class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    @artist = Artist.find_or_create_by(name: params['artist_name'])
    @song = Song.create(name: params['song_name'])
    @genre = Genre.find(params['genres'])
    @artist.songs << @song
    @song.genres << @genre

    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_or_create_by(name: params['artist_name'])
    @song.artist = @artist
    @artist.songs << @song
    @song.genres << Genre.find(params['genres'])
    @song.save

    flash[:message] = "Successfully updated song."
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'/songs/edit'
  end
end
