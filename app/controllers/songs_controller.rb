# require 'rack-flash'

class SongsController < ApplicationController

  get '/songs' do
    # binding.pry
    @songs = Song.all
    erb :'./songs/index'
  end

  get '/songs/new' do
    erb :'./songs/new'
  end

  post '/songs/new' do
    @artist = Artist.find_or_create_artist(params)
    @song = Song.create(params["song"])
    @song.artist = @artist
    @song.genres << Genre.find(params["genre"]["id"])
    # binding.pry
    session[:notice] = "Successfully created song."
    # binding.pry
    @song.save
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @notice = session[:notice]
    # binding.pry
    @song = Song.find_by_slug(params[:slug])
    @genres = @song.genres
    # binding.pry
    erb :'./songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = @song.genres
    # binding.pry
    erb :'./songs/edit'
  end

  post '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    if !params["song"]["name"].empty?
      # binding.pry
      @song.update(params["song"]["name"])
    end
    # binding.pry
    if !params["new_artist"]["name"].empty?
      @song.artist.update(name: Artist.find_or_create_artist(params).name)
    end
    # binding.pry
    session[:notice] = "Successfully updated song."
    if !@song.genres.include?(Genre.find_by(params["genre"]))
      @song.genres << Genre.find_by(params["genre"])
    end

    # binding.pry
    @song.save
    redirect to "/songs/#{@song.slug}"
  end
end
