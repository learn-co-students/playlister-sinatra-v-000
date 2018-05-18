require 'pry'

class SongsController < ApplicationController

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
    @song = Song.find_by_slug(params[:slug]).first
    @artists = Artist.all
    @genres = Genre.all
    erb :'songs/edit'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug]).first
    @artist = Artist.find(@song.artist_id)
    erb :'songs/show'
  end

  post '/songs' do
    # binding.pry
    @song = Song.create(params[:song])
    @song.artist = Artist.create(params[:artist]) if !params[:artist][:name].empty?
    @song.genre = Genre.create(params[:genre]) if !params[:genre][:name].empty?
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  patch '/songs' do
    @song = Song.update(params[:song])
    @song.artist = Artist.create(params[:artist]) if !params[:artist][:name].empty?
    @song.genre = Genre.create(params[:genre]) if !params[:genre][:name].empty?
    @song.save
    redirect "/songs/#{@song.slug}"
  end
end
