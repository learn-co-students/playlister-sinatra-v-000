require 'pry'
class SongsController < ApplicationController
  
  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    @artist = Artist.find_or_create_by(name: params["Artist Name"])
    song = Song.create(name: params["Name"], artist: @artist)
    params[:genres].each do |genre|
      genre_obj = Genre.find_by_id(genre)
      song.genres << genre_obj
    end
    @songs = Song.all
    erb :'songs/index', locals: {message: "Successfully created song."}
  end
  
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:id' do
    @song = Song.find_by_slug(params[:id])
    erb :'songs/show'
  end

  get '/songs/:id/edit' do
    @song = Song.find_by_slug(params[:id])
    @genres = Genre.all
    erb :'songs/edit'
  end

  post '/songs/:id/edit' do
    @song = Song.find_by_slug(params[:id])
    @genres = Genre.all
    erb :'songs/edit'
  end

  patch '/songs/:id' do
    @song = Song.find_by_slug(params[:id])
    @artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.update(name: params["Name"], artist: @artist)
    @song.genres.clear
    params[:genres].each do |genre|
      genre_obj = Genre.find_by_id(genre)
      @song.genres << genre_obj
    end
    erb :"songs/show", locals: {message: "Song successfully updated."}
  end

end