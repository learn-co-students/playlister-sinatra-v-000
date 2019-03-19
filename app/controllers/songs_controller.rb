require 'rack-flash'
class SongsController < ApplicationController
use Rack::Flash

  get '/songs' do
    @songs = Song.all

    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/song' do
    @artist = Artist.find_or_create_by(:name => params[:artist])

    @song = Song.create(:name => params[:name])

    @song.artist = @artist
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully created song."

    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.all.find_by_slug(params[:slug])
    @song_artist = @song.artist
    @song_genres = @song.genres
    erb :'songs/show'

  end

  get '/songs/:slug/edit' do
    @song = Song.all.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @artist = Artist.find_or_create_by(:name => params[:artist])

    @song = Song.all.find_by_slug(params["slug"])

    @song.artist = @artist

    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully updated song."

    redirect "/songs/#{@song.slug}"
  end

end
