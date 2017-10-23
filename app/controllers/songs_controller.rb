require 'sinatra/flash'
class SongsController < ApplicationController

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs/:slug' do
    @song =  Song.create(name: params["Name"])
    @artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.artist = @artist
    @song.genre_ids = params["genres"]
    #binding.pry
    @song.save
    flash[:message] = "Successfully created song."

    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
      @song = Song.find_by_slug(params[:slug])
      @artist = Artist.find_or_create_by(name: params["Artist Name"])
      @song.update(name: params["Name"], artist_id: @artist.id )
      @song.genre_ids = params["genres"]
      @song.save
      #binding.pry
      flash[:message] = "Successfully updated song."
      redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

end
