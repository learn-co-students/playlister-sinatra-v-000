#getting boot error on /songs/new

require 'rack-flash'

class SongsController < ApplicationController

  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do 
    @song = Song.create(name: params[:song_name])
      if params.key?(:song_artist)
        @artist = Artist.find_by_slug(params[:song_artist])
      else
        @artist = Artist.find_or_create_by(name: params[:new_artist_name])
      end
    @song.artist = @artist
    @genre_all = []
      if params[:song_genre]
        @genre_all << Genre.find_by_slug(params[:song_genre])
      elsif !params[:new_song_genre].empty?
        @genre_all << Genre.find_by_slug(params[:new_song_genre])
      end
        
    @song.genres = @genre_all
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    @genres = @song.genres.collect {|s| s.name}
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @artists = Artist.all
    @genres = Genre.all
    erb :'/songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:song_name]
      if params.key?("new_artist_name") && params["new_artist_name"].empty?
        @artist = Artist.find_by_slug(params[:artist_name])
      else
        @artist = Artist.find_or_create_by(name: params["new_artist_name"])
      end
    @song.artist = @artist
    @genre = []
      if !params["new_song_genre"].empty?
        @genre << Genre.find_or_create_by(name: params[:new_song_genre])
      else
        @genre << Genre.find_by_slug(params[:song_genre])
      end
    @song.genres = @genre
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end




end