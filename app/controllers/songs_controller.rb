class SongsController < ApplicationController
  # require 'rack-flash'
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs' do
    @artist = Artist.find_or_create_by({name: params[:artist]})
    @song = Song.find_or_create_by({name: params[:name]})
    @song.artist = @artist
    @song.genres.clear
    params[:genres].each{|genre| @song.genres << Genre.find(genre)}
    @song.save

    # flash[:message] = "Successfully created song."

    redirect "/songs/#{@song.slug}"
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
    @song.artist.update({name: params[:artist]})
    @song.update({name: params[:name]})
    @song.genres.clear 
    params[:genres].each{|genre| @song.genres << Genre.find(genre)}
    @song.save
    redirect "/songs/#{@song.slug}"
  end


end