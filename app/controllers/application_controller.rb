class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/songs' do
    @songs = Song.all
    # binding.pry
    erb :songs
  end

  get '/artists' do
    @artists = Artist.all
    # binding.pry
    erb :artists
  end

  get '/genres' do
    @genres = Genre.all
    # binding.pry
    erb :genres
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :show_song
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :show_artist
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :show_genre
  end
end
