require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params[:song][:name])
    params[:genres].each { |genre_id| @song.genres << Genre.find(genre_id.to_i) }

    if Artist.all.any? { |artist| artist.name == params[:song][:artist] }
      artist = Artist.find_by(name: params[:song][:artist])
    else
      artist = Artist.create(name: params[:song][:artist])
    end

    @song.artist = artist
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
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
    @song.genres.clear
    params[:genres].each { |genre_id| @song.genres << Genre.find(genre_id.to_i) }

    if Artist.all.any? { |artist| artist.name == params[:song][:artist] }
      artist = Artist.find_by(name: params[:song][:artist])
    else
      artist = Artist.create(name: params[:song][:artist])
    end

    @song.artist = artist
    @song.save

    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end
end
