require 'rack-flash'
class SongsController < ApplicationController

  enable :sessions
  use Rack::Flash

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(name: params[:song_name])
    params[:genres].each do |genre_id|
      @song.genres << Genre.find(genre_id)
    end
    if params[:artist][:name] != ""
      @artist = @song.artist
      @artist.update(name: params[:artist][:name])
    end
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    @artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song = Song.create(name: params[:song_name], artist: @artist)
    params[:genres].each do |genre_id|
      @song.genres << Genre.find(genre_id)
    end
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end
end