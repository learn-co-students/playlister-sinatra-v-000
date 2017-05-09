require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song]) unless Song.find_by_slug(params[:song][:name])
    if artist = Artist.all.detect {|artist| params[:artist][:name] == artist.name}
      @song.artist = artist
    else
      @song.artist = Artist.create(name: params[:artist][:name])
    end
    @song.save
    flash[:success] = "Successfully created song."

    redirect to "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
   erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    if artist = Artist.find_by(name: params[:artist][:name])
      @song.artist = artist
    else
      @song.artist = Artist.create(name: params[:artist][:name])
    end
    @song.update(params[:song])
    flash[:update] = "Successfully updated song."
    redirect to "songs/#{@song.slug}"
  end

end