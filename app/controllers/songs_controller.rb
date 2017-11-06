require "rack/flash"
require "rack/flash/test"

class SongsController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  enable :sessions

  get '/songs' do
    erb :songs
  end

  post '/songs' do
    artist = Artist.find_by(name: params[:artist])
    if artist == nil
      artist = Artist.create(name: params[:artist])
    end
    genres = []
    params[:genres].each do |genre|
      genres << Genre.find_by(name: genre)
    end
    song = Song.create(name: params[:name], artist: artist, genres: genres)
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{song.slug}"
  end

  get '/songs/new' do
    erb :new_song
  end

  patch '/songs/:slug' do
    artist = Artist.find_by(name: params[:artist])
    if artist == nil
      artist = Artist.create(name: params[:artist])
    end
    genres = []
    params[:genres].each do |genre|
      genres << Genre.find_by(name: genre)
    end
    song = Song.find_by(name: params[:slug])
    song.update(name: params[:name], artist: params[:artist], genres: genres)
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    @genres = @song.genres
    #binding.pry
    erb :song_slug
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    @genres = @song.genres
    #binding.pry
    erb :song_edit
  end

end
