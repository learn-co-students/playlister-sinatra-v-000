require 'pry'
class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end
  
  get '/songs/new' do
    @genres = Genre.all ##
    erb :'songs/new'
  end
  
  post '/songs' do
    artist = Artist.create(name: params[:Artist_Name])
    @song = Song.create(name: params[:Name])
    @song.artist = artist
    params[:genres].each do |genre|
      @song.genres << Genre.find(genre)
    end
    erb :'/songs/show', locals: {message: "Successfully created song."}
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show', locals: {message: "Song successfully updated."}
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:Name]
    @song.artist = Artist.find_or_create_by(name: params[:Artist_Name])
    params[:genres].each do |genre_id|
      @song.genres << Genre.find(genre_id)
    end
    @song.save
    redirect to "/songs/#{@song.slug}"
  end



end