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
    @artist = Artist.create(name: params[:new_artist_name])
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
    @genres = @song.genres.collect {|s| s.name}
    erb :'/songs/show'
  end




end