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
  
  get "/songs" do
    erb :songs
  end
  
  get "/artists" do
    erb :artists
  end
  
  get "/genres" do
    erb :genres
  end
  
  get "/songs/new" do
    erb :song_new
  end
  
  post "/songs" do

    
    song = Song.find_or_create_by(name: params[:song_name])
  
    
    
    artist = Artist.find_or_create_by(name: params[:artist_name])
    song.artist = artist  
  
    
    
    params[:genres].each do |genre|
    gen = Genre.find_or_create_by(id: genre)  
    song.song_genres.build(genre: gen)
    end
    
    song.save
  
    flash[:message] = "Successfully created song."
    
    redirect "songs/#{Song.find_by(name: params[:song_name]).slug}"
   
    
  end
  
  get "/songs/:slug" do
  
    @song = Song.find_by_slug(params[:slug])
  #  binding.pry
    erb :song_s
  end
  
  get "/songs/:slug/edit" do
  
    @song = Song.find_by_slug(params[:slug])
  #  binding.pry
    erb :song_e
  end
  
  patch '/songs/:slug' do

 
    
    if params[:song_name].empty?
    @song = Song.find_by_slug(params[:slug])
    else
    @song = Song.find_or_create_by(name: params[:song_name])
    end
    
  
    if params[:something]!= nil
    artist = Artist.find_or_create_by(name: params[:something])
    @song.artist = artist
    elsif !params[:artist_name].empty?
    artist = Artist.find_or_create_by(name: params[:artist_name])
    @song.artist = artist
    end
    
    
    if params[:genres]!=nil
      @song.genres.clear
      @song.song_genres.clear
      params[:genres].each do |genre|
      gen = Genre.find_or_create_by(id: genre)  
      @song.song_genres.build(genre: gen)
      @song.genres << gen
      end
    else
      
    end
    
    @song.save
    
   
  
    flash[:updates] = "Successfully updated song."
    
    redirect "songs/#{@song.slug}"
  
  end
  
  get "/artists/:slug" do
  
    @artist = Artist.find_by_slug(params[:slug])
    erb :artist_s
  end
  
  get "/genres/:slug" do
  
    @genre = Genre.find_by_slug(params[:slug])
    erb :genre_s
  end
end