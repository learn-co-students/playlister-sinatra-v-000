require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :"songs/new"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :"songs/edit"
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:song_name]
    @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    @song.genre_ids = params[:genres]
#    @song.genres.clear
#    @params[:genres].each do | genre |
#      @song.genres.push (Genre.find(genre))
#    end
    @song.save
    flash[:message] = "Successfully updated song."
    redirect :"/songs/#{@song.slug}"
  end

  post '/songs' do
    @song = Song.new(name: params[:song_name])
    @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    @song.genre_ids = params[:genres]
#    params[:genres].each do | genre_id |
#      @song.genres.push (Genre.find(genre_id))
#    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect :"/songs/#{@song.slug}"
  end

end
