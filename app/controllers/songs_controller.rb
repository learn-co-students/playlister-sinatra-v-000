require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash 

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params[:song_name], genre_ids: params[:genre_ids] )
    @artist = Artist.find_or_create_by(name: params[:artist_name])
    @song.artist = @artist
      if !params[:genre_name].empty?
        @song.genres << @genre = Genre.find_or_create_by(name: params[:genre_name])
      end
      @song.save
      flash[:message] = "Successfully created song."
      redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_or_create_by(name: params[:artist_name])
    @song.update(name: params[:song_name], artist: @artist, genre_ids: params[:genre_ids])
    if !params[:genre_name].empty?
      @song.genres << @genre = Genre.find_or_create_by(name: params[:genre_name])
    end
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "songs/#{@song.slug}"
  end


end
