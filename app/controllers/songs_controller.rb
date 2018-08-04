require 'pry'
class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @current_song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    @artist = Artist.find_by(name: params[:artist])
    if @artist
      @current_song = Song.create(name: params[:song])
      @current_song.artist = @artist
      params[:genres].each do |genre_id|
        @genre = Genre.find_by_id(genre_id)
        @genre.songs << @current_song
      end
      @current_song.save
      flash[:message] = "Successfully created song."
      redirect "/songs/#{@current_song.slug}"
    else
      @new_artist = Artist.create(name: params[:artist])
      @current_song = Song.create(name: params[:song])
      @current_song.artist = @new_artist
      params[:genres].each do |genre_id|
        @genre = Genre.find_by_id(genre_id)
        @genre.songs << @current_song
      end
      @current_song.save
      flash[:message] = "Successfully created song."
      redirect "/songs/#{@current_song.slug}"
    end
  end

  get '/songs/:slug/edit' do
    @current_song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug/edit' do
    @current_song = Song.find_by_slug(params[:slug])
    @current_song.name = params[:song]
    @artist = Artist.find_by(name: params[:artist])
      if @artist
        @current_song.artist = @artist
      else
        @new_artist = Artist.create(name: params[:artist])
        @current_song.artist = @new_artist
      end
    @current_song.genres.clear
    params[:genres].each do |genre_id|
      @genre = Genre.find_by_id(genre_id)
      @genre.songs << @current_song
    end
    @current_song.save
    flash[:message] = "Successfully updated song."

    redirect "/songs/#{@current_song.slug}"
  end
end
