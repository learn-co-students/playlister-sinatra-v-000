require 'sinatra/base'
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
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    erb :'songs/show'
  end

  post '/songs' do
    @song = Song.create(:name => params[:song][:name])
    @artist = Artist.find_by(:name => params[:artist][:name])
      if @artist.nil?
        @song.artist = Artist.create(:name => params[:artist][:name])
      else
        @song.artist = @artist
      end
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_by(:name => params[:artist][:name])
      if @artist.nil?
        @song.artist = Artist.create(:name => params[:artist][:name])
      else
        @song.artist = @artist
      end
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

end
