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
    @song = Song.create(params[:name])

    # Song belongs to 1 artist
    @song.artist = Artist.find_or_create_by(:name =>params["Artist Name"])

    #Song has multiple genres
    # @song.genre = Genre.find
    # @song.genre = Genre.all
    # @genre = Genre.find_by_slug(params[:slug])


    flash[:message] = "Successfully created song"
    redirect("/songs/#{@song.slug}")

  end


  get 'songs/:slug' do
    erb :'songs/show'
  end


  get 'songs/:slug/edit' do
    erb :'songs/edit'
  end


  patch 'songs/:slug' do
    flash[:message] = "Successfully updated song."
    redirect ("/songs/#{@song.slug}")
    erb :'songs/update'

  end
