require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @all_songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    if @song != nil 
      @artist = @song.artist
      @genres = @song.genres
      erb :'/songs/show'
    else
      erb :'/songs/new'
    end
  end

  post '/songs' do
    @song = Song.create(name: params["name"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genre_ids = params["genres"]
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params["song"])
    @song.artist = Artist.find_or_create_by(name: params["Artist"]["name"])
    @song.save

    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end


end