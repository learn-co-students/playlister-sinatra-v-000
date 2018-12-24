

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
    if !params[:artist][:name].empty?
      @song.artist = Artist.find_or_create_by(:name => params[:artist][:name])
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

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    if !params[:artist][:name].empty?
      @song.artist = Artist.find_or_create_by(:name => params[:artist][:name])
    end
    if !params[:song][:genre_ids].empty?
      @song.replace_genres(params[:song][:genre_ids])
    end
    if params[:song][:name] != @song.name
      @song.name = params[:song][:name]
    end
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to ("/songs/#{@song.slug}")
  end

  get '/songs/:slug/edit' do
    @artists = Artist.all
    @genres = Genre.all
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end
end
