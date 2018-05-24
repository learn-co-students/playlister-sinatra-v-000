require 'pry'
require 'rack-flash'

class SongsController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/songs") }
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :index
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :new
  end

  post '/songs' do
    @song = Song.create(params[:song])

    artist = Artist.find_or_create_by(name: params["artist"]["name"])
    @song.artist = artist
    @song.genre_ids = params[:genres]
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    erb :show
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist.name
    erb :edit
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])

    artist = Artist.find_or_create_by(name: params["artist"]["name"])
    @song.artist = artist
    @song.genre_ids = params[:genres]
    @song.save
    flash[:message] = "Successfully updated song."
    erb :show
  end
end
