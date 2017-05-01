require 'pry'
class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    # binding.pry
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    # binding.pry
    erb :'songs/new'
  end

  post '/songs' do
    binding.pry
    @song = Song.create(name: params[:Name])
    genres = params[:genres]
    if !params["Artist Name"].empty?
      @song.artist = Artist.create(name: params["Artist Name"])
    end
    genres.each do |id|
      @song.genres << Genre.find_by_id(id)
    end
    @song.save
    redirect "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    # binding.pry
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end


end
