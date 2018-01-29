require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params[:name])

    if Artist.all.find_by(name: params[:artist_name])
      artist = Artist.all.find_by(name: params[:artist_name])
    else
      artist = Artist.create(name: params[:artist_name])
    end
    genre = Genre.find_by_id(params[:genres].first)#iterate and make work for multiple genres

    @song.artist = artist
    @song.genres << genre
    @song.save

    flash[:message] = "Successfully created song."#This is for flash message
    redirect to("/songs/#{@song.slug}")
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    if Artist.all.find_by(name: params[:artist_name])
      artist = Artist.all.find_by(name: params[:artist_name])
    else
      artist = Artist.create(name: params[:artist_name])
    end



    @song.artist = artist
    @song.save

    flash[:message] = "Successfully updated song."#This is for flash message

    redirect to("/songs/#{@song.slug}")
  end

end
