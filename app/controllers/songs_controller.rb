class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params[:song_name])

    @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    @song.artist.songs << @song
    # binding.pry
    @song.genres << Genre.find_by(params[:genres])
    @song.save
    # binding.pry
    redirect "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do

    erb :'/songs/edit'
  end

  patch '/songs/:slug' do

    redirect "songs/#{@song.slug}"
  end

end