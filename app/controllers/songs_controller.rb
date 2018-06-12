class SongsController < ApplicationController

  get '/songs' do

    @songs = Song.all
    @songs = @songs.sort_by { |song| song.name }
    erb :'songs/index'
  end

  post '/songs' do
    new_song = Song.new(name: params[:Name])
    if Artist.find_by(name: params["Artist Name"])
      new_song.artist = Artist.find_by(name: params["Artist Name"]) 
    else
      new_song.artist = Artist.create(name: params["Artist Name"]) 
    end
    params[:genres].each do |genre|
      new_song.genres << Genre.find(genre)
    end
    new_song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{new_song.slug}"

  end

  get '/songs/new' do
    erb :'songs/new'
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
    patched_song = Song.find_by_slug(params[:slug]) 
    if Artist.find_by(name: params["Artist Name"])
      patched_song.artist = Artist.find_by(name: params["Artist Name"]) 
    else
      patched_song.artist = Artist.create(name: params["Artist Name"]) 
    end
    params[:genres].each do |genre|
      patched_song.genres << Genre.find(genre)
    end
    patched_song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{patched_song.slug}"
    
  end
  


end
