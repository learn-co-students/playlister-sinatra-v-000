require 'pry'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/songs' do
    @songs = Song.all
    erb :songs_index
  end

  get '/artists' do
    @artists = Artist.all
    erb :artists_index
  end

  get '/genres' do
    @genres = Genre.all
    erb :genres_index
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :songs_new
  end

  post '/songs' do
    artist = Artist.find_or_create_by(name: params[:artist])
    @song = Song.find_or_create_by(name: params[:name])
    genre = Genre.find_or_create_by(name: params[:genres])
    @song.artist = artist
    @song.genres << genre
    @song.save
    erb :songs_created
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :songs_show
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :artists_show
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :genres_show
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :songs_edit
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:name] if params[:name] != ""
    @song.artist = Artist.find_or_create_by(name: params[:artist]) if params[:artist] != ""
    @song.genre = Genre.find_or_create_by(name: params[:genre]) if params.has_key?(:genre)
    @song.save
    erb :song_editted
  end

end