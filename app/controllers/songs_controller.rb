require 'sinatra/base'
require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs' do

    if !Artist.find_by_name(params[:song][:artist])
      @artist = Artist.create(name: params[:song][:artist])
    else
      @artist = Artist.find_by_name(params[:song][:artist])
    end

    @new_song = Song.new(name: params[:song][:name], artist: @artist, genre_ids: params[:song][:genre_ids])
    @new_song.save

    flash[:message] = "Successfully created song."
    redirect "/songs/#{@new_song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'

  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  post '/songs/:slug' do
    @updated_song = Song.find_by_slug(params[:slug])

    if !params[:song][:artist].empty?
      if !Artist.find_by_name(params[:song][:artist])
        artist = Artist.create(name: params[:song][:artist])
      else
        artist = Artist.find_by_name(params[:song][:artist])
      end
    else
      artist = @updated_song.artist
    end

    @updated_song.update(name: params[:song][:name], artist: artist, genre_ids: params[:song][:genre_ids])

    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@updated_song.slug}"
  end

end