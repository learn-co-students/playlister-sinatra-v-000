class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :"/song/songs"
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :"/song/new"
  end

  post  '/songs' do
    song = Song.new(name: params[:song_name])
    artist = Artist.find_by(name: params[:artist_name])
    if artist
      song.artist = artist
    else
      song.build_artist(name: params[:artist_name])
    end
    song.genres << Genre.find(params[:genre_id])
    song.save

    redirect to "/songs/#{song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/song/show"
  end

end
