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
    @song = Song.find_by(name: params[:Name])
    if @song == nil
      @song = Song.create(name: params[:Name])
    end

    @artist = Artist.find_by(name: params["Artist Name"])
    if @artist != nil
      @song.artist = @artist
    else
      @artist = Artist.create(name: params["Artist Name"])
      @song.artist = @artist
    end

    params[:genres].each do |a|
      SongGenre.create(genre_id: a, song_id: @song.id)
    end

    erb :created_song
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :edit_song
  end

  post '/songs/:slug/edit' do
    @song = Song.find_by(name: params[:Name])
    @song.name = params[:Name]

    @artist = Artist.find_by(name: params["Artist Name"])
    if @artist != nil
      @song.artist = @artist
    else
      @artist = Artist.create(name: params["Artist Name"])
      @song.artist = @artist
    end

    params[:genres].each do |a|
      SongGenre.create(genre_id: a, song_id: @song.id)
    end

    erb :updated_song

  end

end












