require 'sinatra/base'
require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    erb :'songs/songs'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs/new' do
    @song = Song.create(name: params[:song][:name])
    @artist = Artist.find_by(name: params[:song][:artist][:name])

      if !!@artist
        @song.artist = @artist
      else
        @song.build_artist(name: params[:song][:artist][:name])
      end

      params[:song][:genre].each do |name_hash|
        @song.genres << Genre.find_by(name_hash)

      end

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

    erb :'songs/edit'
  end

  put '/songs/:slug/edit' do
    @song = Song.find(params[:song][:id])
    @song.name = params[:song][:name]
    @song.artist.name = params[:song][:artist][:name]

    params[:song][:genre].each do |name_hash|
      @song.genres << Genre.find_by(name_hash)
    end
    #binding.pry
    @song.save
    @song.artist.save

    flash[:message] = "Successfully updated song."

    redirect "/songs/#{@song.slug}"

  end


end
