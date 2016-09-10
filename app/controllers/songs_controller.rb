require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    song = Song.create(params[:song])
    if !params[:artist][:name].empty?
      artist = Artist.find_or_create_by(name: params[:artist][:name])
      song.artist = artist
      song.save
    end
    flash[:message] = "Successfully created song."
    redirect to("/songs/#{song.slug}")
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  post '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    song.artist = Artist.find_or_create_by(name: params[:song][:artist]) unless params[:song][:artist].empty?
    song.genre_ids = params[:song][:genre_ids]
    song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{song.slug}"
  end
end