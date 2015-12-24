class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/songs' do
    erb :"songs/songs"
  end

  get '/artists' do
    erb :"artists/artists"
  end

  get '/genres' do
    erb :"genres/genres"
  end

  get '/songs/new' do
    erb :"songs/new_song"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/song_slug"
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :"genres/genre_slug"
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :"artists/artist_slug"
  end

  post '/songs/new' do
    @song = Song.create(:name => params["Name"])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    params["genre"].each{|g| @song.genres << Genre.find_or_create_by(name: g)}
    @song.save
    erb :"songs/song_slug", :locals => {:message => "Successfully created song."}
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/edit_song"
  end

  post '/songs/:slug/edit' do
    @song = Song.create(:name => params["Name"])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    params["genre"].each{|g| @song.genres << Genre.find_or_create_by(name: g)}
    @song.save
    erb :"songs/song_slug", :locals => {:message => "Song successfully updated."}
  end
end