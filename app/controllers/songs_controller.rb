require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params["Name"])
    @artist = Artist.find_by_name(params["Artist Name"])

    if @artist
      @song.artist = @artist
    else
      @song.artist = Artist.create(name: params["Artist Name"])
    end

    @song.genre_ids = params[:genres]
    @song.save
    # binding.pry
    flash[:message] = "Successfully created song."

    # erb :'/songs/show'
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist #this is an object
    @genres = @song.genres #this is an array
    # binding.pry
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_by_name(params["Artist Name"])

    if @artist
      @song.artist = @artist
    else
      @song.artist = Artist.create(name: params["Artist Name"])
    end
    @song.genre_ids = params[:song][:genre_ids]
    # @song.update(params[:song])
    @song.save
    # binding.pry
    flash[:message] = "Successfully updated song."

    redirect "/songs/#{@song.slug}"
  end


end
