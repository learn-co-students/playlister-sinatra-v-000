require 'pry'
require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all

    erb :'/songs/index'
  end

  get '/songs/new' do
    @songs = Song.all

    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params[:Name])

    if !params["Artist Name"].empty?

      @song.artist = Artist.create(name: params["Artist Name"])

      @song.save
    
    end
    flash[:message] = "Successfully created song."
    redirect to "songs/#{@song.slug}"

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

    @song.update(name: params[:name])

    if !params[:song][:artist_name].empty?

      artist = Artist.find_or_create_by(name: params[:name])

      @song.update(name: params[:name])
    end

    @song.save
    flash[:message] = "Successfully updated song."

    redirect "songs/#{@song.slug}"

  end
end
