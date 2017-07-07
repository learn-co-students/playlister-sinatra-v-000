require 'rack-flash'
class SongsController < ApplicationController
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params["song_name"])
    @song.artist = Artist.find_or_create_by(name: params["artist_name"])
    @song.genre_ids = params[:genres]
    if !params[:genre_name].empty?
      @song.genres << Genre.create(name: params[:genre_name])
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post '/songs/:slug' do
      @song = Song.find_by_slug(params[:slug])
      @song.name = params["song_name"]
      @song.artist = Artist.find_or_create_by(name: params["artist_name"])
      @song.genre_ids = params[:genres]
      if !params[:genre_name].empty?
        @song.genres << Genre.create(name: params[:genre_name])
      end
      @song.save
      flash[:message] = "Successfully updated song."
      redirect to "/songs/#{@song.slug}"
    end

  post '/songs/:slug/delete' do
    @song = Song.find_by_slug(params[:slug])
    @song.delete
    redirect to '/songs'
  end

end
