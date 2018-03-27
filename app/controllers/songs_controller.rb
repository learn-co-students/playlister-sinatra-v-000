require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs' do
    @artist = Artist.find_or_create_by(name: params["artist_name"])
    @song = Song.create(name: params["song_name"])
    @song.genre_ids = params["genres"]
    @song.artist = @artist
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_or_create_by(name: params["artist_name"])
    @song.update(genre_ids: params["genres"])
    @song.artist = @artist
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

end
