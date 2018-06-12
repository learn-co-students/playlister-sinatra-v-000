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

    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Sonf.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end
end
