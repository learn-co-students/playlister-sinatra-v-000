require 'rack-flash'

class SongsController < ApplicationController
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
    @song = Song.create(name: params['Name'], genre_ids: params["genres"])
    # why does it work with genre_ids? is this the best way?
    @song.artist = Artist.find_or_create_by(name: params['Artist Name'])
    @song.save
    # binding.pry
    flash[:message] = "Successfully created song."

    # redirect works without flash but not with - is flash set up correctly?
    redirect to "/songs/#{@song.slug}"
  end

   get '/songs/:slug' do
     @song = Song.find_by_slug(params[:slug])
     @artist = @song.artist
     @genres = @song.genres.all
     erb :'/songs/show'
   end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    # @song.artist = Artist.find_or_create_by(name: params['Artist Name'])
    # @song.save

    erb :'/songs/edit'
  end

  patch '/songs/:slug' do

    # puts params
    @song = Song.find_by_slug(params[:slug])
    # binding.pry
    @song.artist = Artist.find_or_create_by(name: params['Artist Name'])
    @song.genre_ids = params["genres"]
    # Be able to change everything about a song, including the genres associated with it and its artist.
    # binding.pry
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end


end
