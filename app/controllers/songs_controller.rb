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

      @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
      @song.genre_ids = params["genres"]
      @song.save

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

    if !params["Artist Name"].empty?
      #binding.pry
      @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
      @song.artist.update(name: params["Artist Name"])
    elsif !params["genres"].empty?
      @song.genres = Genre.find_or_create_by(genres: params[:genres])
      @song.genres.update(genres: params[:genres])
    end
    @song.save
    flash[:message] = "Successfully updated song."

    redirect "songs/#{@song.slug}"

  end
end
