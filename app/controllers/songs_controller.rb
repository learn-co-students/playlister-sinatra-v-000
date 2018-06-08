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

    @song = Song.create(name: params[:name])
    @artist = Song.create(name: params[:artist_name])
    @artist.save
    @song.save
    erb :'/songs/index'
  end


  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @genres = @song.song_genres
    @artist = @song.artist
    erb :'/songs/show'
  end




end
