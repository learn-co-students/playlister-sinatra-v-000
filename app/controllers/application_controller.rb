require 'sinatra/base'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  enable :sessions
  use Rack::Flash
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }


  get '/' do
    erb :index
  end

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/create'
  end

  post '/songs/new' do
    s = Song.create(name: params["song_name"])
    if !!Artist.find_by(name: params["artist_name"])
      a = Artist.find_by(name: params["artist_name"])
      s.artist_id = a.id
    else
      a = Artist.create(name: params["artist_name"])
      s.artist_id = a.id
    end
    params['genres'].each do |genre|
      s.genres << Genre.find(genre)
    end
    s.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{s.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug/edit' do
    s = Song.find_by_slug(params["song_slug"])
    s.update(name: params["song_name"])
    if !!Artist.find_by(name: params["artist_name"])
      a = Artist.find_by(name: params["artist_name"])
      s.artist_id = a.id
    else
      a = Artist.create(name: params["artist_name"])
      s.artist_id = a.id
    end
    s.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{s.slug}"
  end

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'/artists/show'
  end

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'/genres/show'
  end

end
