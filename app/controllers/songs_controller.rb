

class SongsController < ApplicationController

  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    change_song(song, params)
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{song.slug}"
  end

  post '/songs' do
    song = create_song(params)
    flash[:message] = "Successfully created song."
    redirect "/songs/#{song.slug}"
  end

  helpers do
    def create_song(params)
      song = Song.new(params[:song])
      artist = Artist.find_or_create_by(name: params[:artist_name])
      artist.songs.concat(song) #saves songs in db
      song
    end

    def change_song(song, params)
      song.update(params[:song])
      if !params[:artist_name].empty?
        artist = Artist.find_or_create_by(name: params[:artist_name])
        artist.songs.concat(song) if song.artist.name != artist.name #updates songs in db
      end
      song
    end
  end
end
