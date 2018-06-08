class SongsController < ApplicationController

  get '/songs' do

    @songs = Song.all

    erb :'/songs/index'
  end

  get '/songs/new' do

    @genres = Genre.all
  erb :'/songs/new'
  end

  get '/songs/:slug' do
      @song = Song.find_by_slug(params[:slug])
      @genres = @song.song_genres
      @artist = @song.artist
      erb :'/songs/show'
    end

  post '/songs' do
    @song = Song.create(name: params[:name])
    @artist = Artist.create(name: params[:artist])
    @genre = Genre.find(params[:genre])
    @song.artist = @artist
    @song.genre = @genre

    @artist.save

    redirect  "/songs/that-one-with-the-guitar"
     #{@song.slug}
  end





end
