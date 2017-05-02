require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    # binding.pry
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    # binding.pry
    @song = Song.find_by_slug(params[:slug])
    # binding.pry
    erb :'songs/show'
  end

  post '/songs' do
    # "Your song is created"
    # binding.pry
    song = Song.create(params[:song])
    if !params[:artist][:name].nil?
      song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    else
      song.artist = Artist.find(params[:artist][:id])
    end
      # {name= "a new song ", artist = {id=[1] name=""}}
      # binding.pry
    song.genres << Genre.find(params[:genres])
    song.save
    # binding.pry
    flash[:message] = "Successfully created song."
    redirect "/songs/#{song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    # binding.pry
    @song.update(params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
      # @song.genre << Genre.find(params[:genres])
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{song.slug}"
  end



end
