require 'pry'
class SongsController < ApplicationController

  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :songs
  end

  get '/songs/new' do
    erb :new_song
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :show_song
  end

  post '/songs' do
    @song = Song.create(name: params[:song][:name])
    @song.artist = Artist.find_or_create_by(params[:artist])
    params[:genres].each do |genre_id|
      @song.genres << Genre.find_by_id(genre_id)
    end
    @song.save

    if Song.all.include?(@song)
      flash[:message] = "Successfully created song."
      redirect "/songs/#{@song.slug}"
    end
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :edit_song
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:song][:name]
    @song.artist = Artist.find_or_create_by(params[:artist])
    @song.genres.clear
    params[:genres].each do |genre_id|
      @song.genres << Genre.find_by_id(genre_id)
    end
    @song.save

    flash[:message] = "Successfully updated song."
    erb :show_song
  end

end
