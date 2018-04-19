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
    song = Song.create(:name => params["song_name"])
    params[:genres].each do |genre|
      song.genres << Genre.find_or_create_by(:name => genre)
    end
    song.artist = Artist.find_or_create_by(:name => params["artist_name"])
    song.save
    flash[:message] = "Successfully created song."
    redirect :"/songs/#{song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    song.artist = Artist.find_or_create_by(:name => params["artist_name"])
    song.save
    erb :'/songs/show'
  end
end
