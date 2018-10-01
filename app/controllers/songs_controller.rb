require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
    #was too far down so tried to pass in as slug
  end

  get '/songs/:slug' do
    #binding.pry
    @song = Song.find_by_slug(params["slug"])
    erb :'songs/show'
  end

  post '/songs' do
    @song = Song.create(name: params["Name"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genre_ids = params["genres"] #plural b/c whats inside table...saving array here
    @song.save
    @songs = Song.all
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}" #double quotes for interpolation
  end


  post '/songs/:slug' do
    if
      @song = Song.find_by_slug(params["slug"])
    else
      @song = Song.create(name: params["Name"])
    end
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genre_ids = params["genres"]
    @song.save
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params["slug"])
    @genres = Genre.all
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    if
      @song = Song.find_by_slug(params["slug"])
    else
      @song = Song.create(name: params["Name"])
    end
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genre_ids = params["genres"]
    @song.save
    flash[:message] = "Successfully updated song."
    erb :'songs/show'
  end


end
