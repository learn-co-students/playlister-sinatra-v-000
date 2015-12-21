require 'pry'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/songs' do
    erb :song_list
  end

  get '/genres' do 
    erb :genre_list
  end

  get '/artists' do 
    erb :artist_list
  end

  get '/songs/:slug' do 
    if params[:slug] == "new"
      erb :new_song
    else
      @song = Song.find_by_slug(params[:slug])
      erb :show_song
    end
  end

  get '/artists/:slug' do 
    @artist = Artist.find_by_slug(params[:slug])
    erb :show_artist
  end

  get '/genres/:slug' do 
    @genre = Genre.find_by_slug(params[:slug])
    erb :show_genre
  end

  post '/songs/new' do 
    erb :created_song
  end

end