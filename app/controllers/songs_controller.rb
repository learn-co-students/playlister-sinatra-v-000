require 'rack-flash'

class SongsController < ApplicationController

enable :sessions
use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    @song = Song.find_or_create_by(name: params[:song_name])
    artist = Artist.find_or_create_by(name: params[:artist_name])
    params[:genres].each do |genre|
      genre = Genre.find_or_create_by(id: genre)
      @song.song_genres.build(genre: genre)
    end
    @song.artist = artist
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(name: params[:song_name])
    @song.artist.update(name: params[:artist_name])
    @song.genres.each do |genre|
      genre_id_string = genre.id.to_s
      if !params[:genres].include?(genre_id_string)
        @song.genres.delete(genre.id)
      end
    end
    params[:genres].each do |genre|
      p_genre = Genre.find_by(id: genre.to_i)
      if !@song.genres.include?(p_genre)
        @song.song_genres.build(genre: p_genre)
        @song.save
      end
    end
    flash[:message] = "Successfully updated song."
    redirect to "songs/#{@song.slug}"
  end
end
