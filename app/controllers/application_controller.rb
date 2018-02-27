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

  get '/artists/new' do
    erb :new_artist
  end

  get '/genres/new' do
    erb :new_genre
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :song
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :artist
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :genre
  end

  get '/songs/:slug/edit' do
    erb :edit_song
  end

  post '/songs/new' do
    @song = Song.create(params[:song])
    @song.genre_ids = params[:genres]
    if !params["artist"]["name"].empty?
      @song.artist = Artist.find_or_create_by_name(params["artist"]["name"])
    end
    @song.save
    redirect "/songs/#{@song.slug}"
  end

end
