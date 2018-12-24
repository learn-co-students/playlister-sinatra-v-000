

class SongsController < ApplicationController

  require 'sinatra'
  require 'sinatra/flash'

  enable :sessions
  register Sinatra::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    @song = Song.create(:name => params[:song][:name])
    if !params[:artist][:name].empty? && !Artist.find_by_name(params[:artist][:name])
      @song.artist = Artist.create(:name => params[:artist][:name])
    else
      @song.artist = Artist.find_by_id(params[:song][:artist_id])
    end
    params[:song][:genre_ids].each do |genre_id|
      @song.genres << Genre.find_by_id(genre_id)
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect to ("/songs/#{@song.slug}")
  end
end
