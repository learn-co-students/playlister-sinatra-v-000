
require 'rack-flash'

class SongController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do #redirecting to /songs
    @song = Song.create(name: params[:name])
    @song.genres << Genre.find_by_id(params[:genres])
    if !Artist.find_by_name(params[:artist_name])
      @song.artist = Artist.create(name: params[:artist_name])
    else
      @song.artist = Artist.find_by_name(params[:artist_name])
    end
    @song.save
    flash[:notice] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    #@genre = Genre.find_by_id(params[:genres])

    if !Artist.find_by_name(params[:artist_name])
      @song.update(artist: Artist.create(name: params[:artist_name]))
    else
      @song.update(artist: Artist.find_by_name(params[:artist_name]))
    end
    flash[:notice] = "Successfully updated song."

    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

end
