require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    @artists = Artist.all
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    song = Song.create(params[:song])
    song_artist = Artist.find_or_create_by(params[:artist])
    song.artist = song_artist
    song_artist.songs << song
    song_artist.save
    song.save
    flash[:message] = "Successfully created song."
    redirect to("/songs/#{song.slug}")
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    binding.pry
    @song.update(params[:song])
    if !params[:artist].empty?
      new_artist = Artist.find_or_create_by(params[:artist])
      @song.artist = new_artist
      new_artist.songs << @song
      new_artist.save
    end
    flash[:message] = "Successfully updated song."
    redirect to("/songs/#{@song.slug}")
  end
end
