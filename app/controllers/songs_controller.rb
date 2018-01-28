require 'sinatra/base'
require 'rack-flash'

class SongsController < ApplicationController

  post '/songs/:slug' do
    binding.pry
    @song = Song.find_by_slug(params[:slug])
    slug = @song.slug

    new_artist = Artist.find_or_create_by(name: params[:artist_name])
    @song.artist = new_artist

    updated_genres = []

    params["genres"].each do |genre_id|
      genre = Genre.find(genre_id.to_i)
       updated_genres << genre
    end

    @song.genres = updated_genres
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{slug}"
  end

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params[:name])
    slug = @song.slug

    params["genres"].each do |genre_id|
      genre = Genre.find(genre_id.to_i)
      @song.genres << genre
    end

    @song.artist = Artist.find_or_create_by(name: params[:artist_name])

    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'/songs/edit'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

end
