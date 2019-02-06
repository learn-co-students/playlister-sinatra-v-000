require 'pry'

class SongsController < ApplicationController

  get '/songs' do

    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    erb :'songs/new'
  end

  get '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do

    @song = Song.create(params[:song])
    @song.save

    if !params[:artist][:name].empty?
      @song.artist = Artist.create(params[:artist])
      @song.save
    end

    redirect '/songs/#{@song.slug}'

  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artists = Artist.all
    @genres = Genre.all

    @song.update(params[:song])

    if !params[:song][:name].empty?
      @song.name = params[:song][:name]
      @song.save
    end

    if !params[:artist][:name].empty?
      @song.artist = Artist.create(params[:artist])
      @song.save
    end

    if !params[:genre][:name].empty?
      @song.genres << Genre.create(params[:genre])
      @song.save
    end

  end
end
