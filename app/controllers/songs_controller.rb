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

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    erb :'/songs/show'
  end

  post '/songs' do
    song = Song.new(params[:song])

    if !params[:artist][:name].empty?
      artist = Artist.find_or_create_by(name: params[:artist][:name])
      song.artist = artist
    end

    if !params[:genres].empty?
      params[:genres].each do |genre_name|
        song.genres << Genre.find_by(name: genre_name)
      end
    end

    song.save
    flash[:message] = "Successfully created song."

    redirect "/songs/#{song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])

    artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.artist = artist
    
    @song.save

    flash[:message] = "Successfully updated song."

    redirect "/songs/#{@song.slug}"
  end



end
