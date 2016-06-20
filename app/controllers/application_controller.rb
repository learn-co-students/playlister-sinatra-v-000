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

  get '/artists' do
    @artists = Artist.all 
    erb :'/artists/index'
  end

  get '/genres' do
    @genres = Genre.all 
    erb :'/genres/index'
  end

  get '/songs/new' do 
    erb :'/songs/new'
  end

  post '/songs/:slug' do
    @artist = Artist.find_by(name: params["Artist Name"])
    @song = Song.create(name: params[:Name])
    @genre = Genre.find_by_id(params[:genres][0])
    @song.genres << @genre
    if @artist
      @artist.songs << @song
    else
      @artist = Artist.create(name: params["Artist Name"])
      @artist.songs << @song
    end
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    @genre = @song.genres[0] 
    erb :'/songs/edit'
  end

  patch '/songs/:slug/edit' do
    @artist_check = Artist.find_by(name: params["Artist Name"])
      if @artist_check
        @artist = Artist.find_by(name: params["Artist Name"])
      else
        @artist = Artist.create(name: params["Artist Name"])
      end
    @song_check = Song.find_by(name: params["Name"])
      if @song_check
        @song = Song.find_by(name: params["Name"])
        @song.artist = @artist
      else
        @song = Song.create(name: params["Name"], artist_id: @artist.id)
      end
      @genre = Genre.find_by_id(params[:genres])
      @song.genres << @genre
      @song.save
      @artist.save
      flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song =  Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/artists/:slug' do
    @artist =  Artist.find_by_slug(params[:slug])
    erb :'/artists/show'
  end

  get '/genres/:slug' do 
    @genre = Genre.find_by_slug(params[:slug])
    erb :'genres/show'
  end    

end