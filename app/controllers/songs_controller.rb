class SongsController < ApplicationController

  get '/songs' do
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params[:Name])
    binding.pry
    @genres = Genre.find_by(id: params[:genres])
    @song.song_genres.build(genre: @genres)

    @artist = Artist.find_or_create_by(name: params["Artist Name"])

    @song.artist = @artist
  end


  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end


end
