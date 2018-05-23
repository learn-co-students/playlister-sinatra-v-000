require 'pry'
class SongsController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/songs") }

  get '/songs' do
    @songs = Song.all
    erb :index
  end

  get '/songs/new' do

    erb :new
  end

  post '/songs' do
    binding.pry
    @song = Song.create(params[:song])

    artist = Artist.find(name: params["artist"]["name"])
    if artist
      @song.artist = artist
    else
      @song.artist = Artist.create(name: params["artist"]["name"])
    end

    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :show
  end

  get 'songs/:slug/edit' do

  end
end
