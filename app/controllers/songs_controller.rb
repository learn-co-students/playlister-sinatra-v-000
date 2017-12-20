require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash
  
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params[:name])
    @song.artist = Artist.find_or_create_by(name: params[:artist])
    @song.genres << Genre.find(params[:genres][0])
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end


end
