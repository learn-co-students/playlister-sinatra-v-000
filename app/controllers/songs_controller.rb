require 'pry'
require 'rack-flash'

class SongsController < ApplicationController

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

    @song.save

    flash[:message] = "Successfully created song."

    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  patch 'songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.artist = params[:artist]
    @song.genres = params[:genres]
    @song.save

    flash[:message] = "Successfully updated song."

    erb :'/songs/show'
  end

end
