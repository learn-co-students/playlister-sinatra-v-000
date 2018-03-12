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

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    erb :'songs/edit'
  end

  post '/songs' do
    song = Song.new(params[:song])
    
    if !params[:artist][:name].empty?
      song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    end
    if !params[:genre][:name].empty?
      song.genres << Genre.create(name: params[:genre][:name])
    end

    song.save

    flash[:message] = "Successfully created song."

    redirect "songs/#{song.slug}"
  end

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])

    song.update(params[:song])

    if !params[:artist][:name].empty?
      song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    end
    if !params[:genre][:name].empty?
      song.genres << Genre.create(name: params[:genre][:name])
    end

    song.save

    flash[:message] = "Successfully updated song."

    redirect "songs/#{song.slug}"
  end

end
