class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all

    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    @new_age_garbage = Genre.find_by(name: "New Age Garbage")

    erb :'songs/new'
  end

  post '/songs/:slug' do
    @song = Song.new
    @song.name = params["song_name"]
    @song.genre_ids = params["genre"]
    @song.save

    @artist = Artist.new
    @artist.name = params["artist_name"]
    @artist.save

    @song.artist = @artist
    @song.save

    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @songs = Song.all

    erb :'songs/show'
  end

  get '/songs/new' do

    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.new
    @song.name = params["song_name"]
  end

end
