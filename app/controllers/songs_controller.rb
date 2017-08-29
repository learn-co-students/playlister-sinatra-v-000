require 'pry'
require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
  #  binding.pry
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.find_or_create_by(name: params[:Name], artist: Artist.find_or_create_by(name: params["Artist Name"]))
    @song.genre_ids = params[:genres]
    @song.save
    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    #binding.pry
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'songs/edit'

  end

  patch '/songs/:slug' do
    #binding.pry
    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:Name]
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to("/songs/#{@song.slug}")
  end

end
