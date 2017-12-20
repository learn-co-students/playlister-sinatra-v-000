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

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @artists = Artist.all
    @genres = Genre.all
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:name] unless params[:name].empty?
    @song.artist = params[:artist] unless params[:artist].empty?
    @song.genres << Genre.find(params[:genres][0]) unless params[:genres[0]].empty?
    @song.save
    flash[:message] = "Successfully edited song."
    redirect to "/songs/#{@song.slug}"
  end

end
