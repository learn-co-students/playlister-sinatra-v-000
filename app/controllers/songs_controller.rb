require 'sinatra/base'
require 'rack-flash'
class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    if !params['artist']['name'].empty?
      @song.artist = Artist.find_or_create_by(name: params['artist']['name'])
      @song.save
    end

    if params['genres'] != nil
      params[:genres].each do |g|
        @song.genres << Genre.find_by(id: g)
      end
    else
      @song.genres=[]
    end

    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @genres = Genre.all
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])

    if !params['artist']['name'].empty?
      @song.artist = Artist.find_or_create_by(name: params['artist']['name'])
      @song.save
    end

    if params['genres'] != nil
      @song.genres=[]
      params[:genres].each do |g|
        @song.genres << Genre.find_by(id: g)
      end
    else
      @song.genres=[]
    end

    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"

  end
end
