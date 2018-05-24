require 'pry'
class SongsController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/songs") }

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
    @song.save

    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    erb :show
  end

  get 'songs/:slug/edit' do

  end
end
