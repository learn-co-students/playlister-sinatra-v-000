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
    @genres = Genre.all
    @artists = Artist.all
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    @song = Song.create(name: params[:name])
    new_artist = Artist.find_or_create_by(name: params[:artist])
    @song.artist = new_artist
    new_artist.songs << @song
    params[:genres].each do |genre|
      @song.genres << Genre.find(genre)
    end
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
    @song.update(name: params["Name"])
    if !params["Artist Name"].empty?
      new_artist = Artist.find_or_create_by(name: params["Artist Name"])
      @song.artist = new_artist
      new_artist.songs << @song
    end
    @song.save
    if !params[:genres].empty?
      params[:genres].each do |genre|
        @song.update(genres: Genre.find(genre))
      end
    end
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

end
