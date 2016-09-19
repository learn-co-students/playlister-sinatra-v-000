require 'rack-flash'
require 'pry'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    artist = Artist.find_or_create_by(name: params[:artist])
    @song = Song.create(params[:song])
    @song.artist = artist
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "songs/#{@song.slug}"
  end



  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(artist: Artist.find_or_create_by(name: params[:song][:artist_name]), genre_ids: params[:song][:genre_ids])
    @song.save
    flash[:message] = "Successfully updated song."
    binding.pry
    redirect to "songs/#{@song.slug}"
  end


end
