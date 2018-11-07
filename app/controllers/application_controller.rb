require 'sinatra/flash'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash

  enable :sessions

  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }


  get '/' do
    erb :index
  end

  get '/songs' do
    @songs = Song.all
    erb :songs
  end

  get '/artists' do
    @artists = Artist.all
    erb :artists
  end

  get '/genres' do
    @genres = Genre.all
    erb :genres
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :new_song
  end

  post '/songs' do

    @song = Song.create(:name => params[:Name])

    if Artist.find_by(name: params["Artist Name"])
      @song.artist = Artist.find_by(name: params["Artist Name"])
      @song.save
    else
      @artist = Artist.create(name: params["Artist Name"])
      @song.artist = @artist
      @song.save
      @artist.songs << @song
      @artist.save
    end

      @song.genres << Genre.find_by(name: params["Genre"])
      @song.save

      flash[:new] = "Successfully created song."

    redirect "/songs/#{@song.slug}"
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
