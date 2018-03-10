class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  use Rack::Flash

  get '/' do
    erb :index
  end

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/songs/new' do
    @songs = Song.all
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    @genres = @song.genres
    erb :'songs/show'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    @songs = @artist.songs
    @genres = @artist.genres
    erb :'artists/show'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    @songs = @genre.songs
    @artists = @genre.artists
    erb :'genres/show'
  end

  post '/songs/' do
    @song = Song.create(:name => params["Name"])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully created song."
    redirect "songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(:name => params["Name"])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end
end
