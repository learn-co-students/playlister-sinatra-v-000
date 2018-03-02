require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash


  get '/songs' do
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params[:Name])
    params[:genres].each do |id|
      genre = Genre.find_by(id: id)
      @song.song_genres.build(genre: genre)
    end

    if !params["Artist Name"].empty?
      artist = Artist.find_or_create_by(name: params["Artist Name"])
      @song.artist = artist
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
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
    @song.genres.clear
    params[:genres].each do |id|
      genre = Genre.find_by(id: id)
        @song.song_genres.build(genre: genre)
    end
    artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.artist = artist
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to("/songs/#{@song.slug}")
  end


end
