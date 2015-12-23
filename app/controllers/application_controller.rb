class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/songs' do
    erb :songs
  end

  get '/artists' do
    erb :artists
  end

  get '/genres' do
    erb :genres
  end

  get '/songs/new' do
    erb :new_song
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :song_slug
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :genre_slug
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :artist_slug
  end

  post '/songs/new' do
    @song = Song.first_or_create(name: params["Name"], artist: params["Artist Name"], genre: params["genre"])
    redirect '/songs'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :edit_song
  end

  post '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(name: params["Name"], artist: params["Artist Name"], genre: params["genre"])
  end
end