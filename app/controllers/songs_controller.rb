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
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params["Name"], artist: Artist.find_or_create_by(name: params["Artist Name"]), genre_ids: params["genres"])
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    # binding.pry
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    # binding.pry
    @song = Song.find_by_slug(params[:slug])
    @song.update(name: params["Name"],artist: Artist.find_or_create_by(name: params["Artist Name"]),genre_ids: params["genres"])
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

end
