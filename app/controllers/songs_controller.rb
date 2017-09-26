require 'pry'
require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    #binding.pry
    song = Song.create(name: params[:song_name])
    artist = Artist.find_or_create_by(name: params[:artist_name])
    song.artist = artist

    params[:genres].each do |genre_id|
      song.genres << Genre.find(genre_id)
    end
    song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'songs/edit'
  end

  post '/songs/:id' do
    binding.pry
    song = Song.find(params[:id])
    song.update(params)
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{song.slug}"
  end

end
