require 'pry'
require 'rack-flash'
class SongsController < ApplicationController
  use Rack::Flash
  enable :sessions

  get '/songs' do
    @songs = Song.all
    # binding.pry
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    # binding.pry
    erb :'songs/new'
  end

  post '/songs' do
    # binding.pry
    @song = Song.create(name: params[:Name])
    genres = params[:genres]
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    if genres
      genres.each do |id|
        @song.genres << Genre.find_by_id(id)
      end
    end

    @song.save
    flash[:message] = "Successfully created song."
    redirect "songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  get '/songs/:slug' do
    # binding.pry
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params["Name"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.save
    redirect "songs/#{@song.slug}"
  end


end
