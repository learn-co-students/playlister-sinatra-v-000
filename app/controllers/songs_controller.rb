require 'rack-flash'
class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'songs/new'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @artists = Artist.all
    @genres = Genre.all
    erb :'songs/edit'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    if !params[:song][:artist][:name].empty?
      @artist = Artist.find_or_create_by(name: params[:song][:artist][:name])
    else
      @artist = Artist.find_by(name: params[:artist])
    end
    @song = Song.create(name: params[:song][:name])
    @song.update(artist: @artist, genre_ids: params[:song][:genre_ids])
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    if !params[:song][:artist][:name].empty?
      @artist = Artist.find_or_create_by(name: params[:song][:artist][:name])
    else
      @artist = Artist.find_by(name: params[:artist])
    end
    @song.update(name: params[:song][:name], artist: @artist, genre_ids: params[:song][:genre_ids])
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

end
