require 'sinatra/base'
require 'rack-flash'

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

  post '/songs' do
    @song = Song.new
    @song.name = params[:song_name]
    @song.artist = Artist.find_or_create_by(:name => params["artist_name"])
    @song.genre_ids = params[:genres]
    @song.save
    flash[:message] = "Successfully created song."
    redirect("/songs/#{@song.slug}")
  end

  get '/songs/:slug/edit' do
    @slug = params[:slug]
    @song = Song.find_by_slug(params[:slug])      
    erb :edit_song
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])  
    @song.update(params[:song]) if !params[:song] == ""
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name]) if !params[:artist][:name].empty?      
    @song.genre_ids = params[:genres]
    @song.save
    flash[:message] = "Successfully updated song."
    redirect("/songs/#{@song.slug}")
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