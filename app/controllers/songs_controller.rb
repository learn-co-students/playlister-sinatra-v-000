require 'rack-flash'

class SongsController < ApplicationController

  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    # binding.pry
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    ##########@songs=Song.all
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params[:Name])

    @song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
    # binding.pry
    @song.genres << Genre.find_by_id(params[:genres])
    @song.save
    # binding.pry
    flash[:message] = "Successfully created song."
    redirect to "songs/#{@song.slug}"
  end
  #
  # post 'songs/new' do
  #
  # end

  get '/songs/:slug' do
    # binding.pry
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do

    @genres = Genre.all
   @song = Song.find_by_slug(params[:slug])
  #  binding.pry
   erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    # binding.pry
    @song.update(name: params[:Name])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "songs/#{@song.slug}"
  end
end
