require 'pry'
class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    #binding.pry
    song = Song.create(name: params[:song_name])
    artist = Artist.find_or_create_by(name: params[:artist_name])
    song.artist = artist

    params[:genres].each do |genre_id|
      song.genres << Genre.find(genre_id)
    end
    song.save
    redirect "/songs/#{song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

end
