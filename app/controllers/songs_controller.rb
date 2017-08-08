require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index' 
  end

  get '/songs/new' do 
    @songs = Song.all
    erb :'/songs/new'
  end

  post '/songs' do 
    @song = Song.create(params[:song])
    if !params["artist"]["name"].empty?
      @song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
    end
    if !params["genre"]["name"].empty?
      @song.song_genres << @song.song_genres.create(genre: Genre.create(params["genre"]["name"]))
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do 
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  get '/songs/:slug' do 
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs/:slug' do 
    @song = Song.find_by_slug(params[:slug])
    @song.update(params["song"])
    if !params["artist"]["name"].empty?
      @song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
    end
    flash[:message] = "Successfully updated song."
    redirect to "songs/#{@song.slug}"
  end
end