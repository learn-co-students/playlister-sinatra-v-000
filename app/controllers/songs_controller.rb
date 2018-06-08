require 'sinatra/flash'

class SongsController < ApplicationController
  enable :sessions
  register Sinatra::Flash

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    @artist = Artist.find_or_create_by(name: params[:artist][:name])
    @artist.songs << @song
    flash[:message] = "Successfully created song."
    redirect ("/songs/#{@song.slug}")
  end

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end



  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'/songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    params[:song][:genre_ids].each do |genre_id|
      @song.genres << Genre.find_by_id(genre_id)
    end
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.save
    flash[:message] = "Successfully updated song."
    redirect ("/songs/#{@song.slug}")
  end

end
