require_relative '../models/concerns/slugifiable.rb'
require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
     @song = Song.find_by_slug(params[:slug])
     @artist = @song.artist
     @genre = @song.genres.first
     erb :'/songs/show'
  end

  post '/songs' do
    @song = Song.create(name: params["Name"])
      if !params["Artist Name"].empty?
        @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
      end
    @song.genres << Genre.find_by_id(params[:genres][0].to_i)
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.name = params["name"]

    if !params["Artist Name"].empty?
      @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    else
      @song.artist =  Artist.find_by_id(@song.artist_id)
    end

    if params["genres"]
      params["genres"].map { |genre| @song.genres << Genre.find_by_id(genre) }
    end

    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

end # SongsController
