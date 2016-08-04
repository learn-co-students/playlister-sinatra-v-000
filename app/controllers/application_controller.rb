require 'sinatra/base'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  enable :sessions
  use Rack::Flash

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
    erb :setup_new
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :setup_edit
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :songs_slug
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.name = params["Song Name"]
    @song.artist = params["Artist Name"]
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

  post '/songs' do
    @song = Song.create(name: params[:Name])

    @song.genre_ids = params[:genres]

    if !(Artist.all.find_by_name(params["Artist Name"]))
      @song.artist = Artist.create(name: params["Artist Name"])
    else
      @song.artist = Artist.all.find_by_name(params["Artist Name"])
    end

    @song.save
    flash[:message] = "Successfully created song."

    redirect "/songs/#{@song.slug}"
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :artists_slug
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :genres_slug
  end
end
