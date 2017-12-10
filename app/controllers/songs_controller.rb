require 'rack/flash'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    if !params[:artist_name].empty?
      @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    end
    @song.save

    session[:create_message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    @artists = Artist.all
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    if !params[:artist_name].empty?
      @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    end
    @song.save

    session[:update_message] = "Successfully updated song."
    redirect to("/songs/#{@song.slug}")
  end

end
