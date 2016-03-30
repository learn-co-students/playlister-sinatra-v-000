require 'pry'
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs' do
    artist = Artist.find_or_create_by(name: params["Artist Name"])
    genres = params["genres"]
    @song = Song.new(name: params["Name"], artist: artist)
    genres.each{|genre| @song.genres << Genre.find(genre.to_i)}
    @song.save
    erb :'songs/show', locals: {message: "Successfully created song."}
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    genres = params["genres"]
    @song.update(name: params["Name"], artist: params["Artist Name"])
    if genres
      @song.genres.clear
      genres.each{|genre| @song.genres << Genre.find(genre.to_i)}
    end
    @song.save
    erb :'songs/show', locals: {message: "Successfully updated song."}
  end

  get '/artists' do
    @artists = Artist.all
    erb :'artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'artists/show'
  end

  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'genres/show'
  end


end
