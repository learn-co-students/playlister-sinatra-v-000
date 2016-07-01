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
    @song = Song.create(params[:song])
    @artist = Artist.find_by(params[:artist])
    if @artist 
      @song.artist = @artist
    else
      @song.artist = Artist.create(params[:artist])
    end
    @song.save

    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
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
    @song.update(params[:song])
    if !Artist.find_by(params[:artist]) && @song.artist.name != params[:artist][:name]
      @song.artist = Artist.create(params[:artist]) 
    else
      @song.artist = Artist.find_by(params[:artist])
    end
    @song.save

    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"

  end
end