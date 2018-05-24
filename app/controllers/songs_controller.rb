class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :"songs/new"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end

  post '/songs' do
    @song = Song.new(name: params[:song_name])
    artist = Artist.find_by name: params[:artist_name]
    artist = Artist.create(name: params[:artist_name]) if !artist
    @song.artist = artist
    params[:genres].each do | genre_id |
      @song.genres.push (Genre.find_by(genre_id))
    end
    @song.save
    redirect :"/songs/#{@song.slug}"
  end

end
