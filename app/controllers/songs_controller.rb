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
    erb :'/songs/new'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    song = Song.new(name: params["name"])
    song.artist = Artist.find_or_create_by(name: params["Artist Name"])


    if params["genre_name"] == ""
      song.genres << params["genres"].collect do |genre|
        Genre.find(genre.to_i)
      end
    else
      song.genres << Genre.find_or_create_by(name: params["genre_name"])
    end
    song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{song.slug}"
  end

  post '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    song.update(artist: Artist.find_or_create_by(name: params["artist_name"]))
    if !params["genre"]["name"].empty?
       song.genres << Genre.create(name: params["genre"]["name"])
    elsif !params["genre_ids"].empty?
       song.genres << Genre.find(params["genre_ids"])
       song.genres.flatten
    end
    song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{song.slug}"
  end


end
