require 'rack-flash'

class SongsController < Sinatra::Base
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
    @genres = Genre.all
    @artists = Artist.all
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    @genre = @song.genres
    erb :'/songs/show'
  end

  post '/songs/new' do
    @song = Song.new(:name => params["name"])
    if params["artist"]
      @song.artist = Artist.find_by(params["artist"])
    else
      if !!Artist.find_by(:name => params["new_artist"])
        @song.artist = Artist.find_by(:name => params["new_artist"])
      else
        @artist = Artist.new(:name => params["new_artist"])
        @artist.save
        @song.artist = @artist
      end
    end
    @song.genres << Genre.where(:id => params["genres"])
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @artists = Artist.all
    @genres = Genre.all
    erb :'/songs/edit'
  end

  patch '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(:name => params["name"])
    if !!params["artist"] && params["new_artist"] == ""
      @artist = Artist.find_by(:id => params["artist"])
      @song.artist = @artist
    else
      if !!Artist.find_by(:name => params["new_artist"])
        @song.artist = Artist.find_by(:name => params["new_artist"])
      else
        @artist = Artist.new(:name => params["new_artist"])
        @artist.save
        @song.artist = @artist
      end
    end
    @song.genres.clear
    @song.genres << Genre.where(:id => params["genres"])
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

end
