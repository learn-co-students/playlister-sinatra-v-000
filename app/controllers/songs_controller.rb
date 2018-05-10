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
    slug = params[:slug]
    @song = Song.all.detect { |song| song.slug == slug}
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

  post '/songs/:slug' do
    
  end
end
