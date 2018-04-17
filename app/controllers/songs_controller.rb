require 'sinatra/base'
require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
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

  post '/songs/new' do
    song = Song.create(name: params[:song][:name])
    artist = Artist.find_or_create_by(name: params[:artist][:name])
    song.artist = artist
    song.save
    genres = []
    params[:song][:genre_id].each do |g_id|
      genre = Genre.find_by_id(g_id)
      genres << genre
    end
    genres.each{|g| song.genres << g if !song.genres.include?(g)}
    song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    song.name = params[:song][:name]
    artist = Artist.find_or_create_by(name: params[:artist][:name])
    song.artist = artist
    song.save
    song.genres.clear
    genres = []
    params[:song][:genre_id].each do |g_id|
      genre = Genre.find_by_id(g_id)
      genres << genre
    end
    genres.each{|g| song.genres << g if !song.genres.include?(g)}
    song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{song.slug}"
  end

end
