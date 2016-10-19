require 'rack-flash'

class ApplicationController < Sinatra::Base

  register Sinatra::ActiveRecordExtension
  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/all'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs/new' do
    @song = Song.new(name: params[:name])
    if params[:new_artist]
      if Artist.find_by(name: params[:new_artist])
        @song.artist = Artist.find_by(name: params[:new_artist])
      else
        @song.create_artist(name: params[:new_artist])
      end
    else
      @song.artist = Artist.find_by(name: params[:artist])
    end
    @song.genres << Genre.find_by(name: params[:genre])
    @song.save
    #binding.pry
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/one'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    if @song.artist.name != params[:artist]
      if Artist.find_by(name: params[:artist])
        @song.artist = Artist.find_by(name: params[:artist])
      else
        @song.create_artist(name: params[:artist])
      end
    end
    @song.genres << Genre.find_by(name: params[:genre])
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/all'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'/artists/one'
  end

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/all'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'/genres/one'
  end
end
