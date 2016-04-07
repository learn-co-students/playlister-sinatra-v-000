class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all

    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'

  end

  get '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])
    #binding.pry
    erb :'/songs/show'
  end

  post '/songs' do
    #binding.pry
    @song = Song.create(params[:song])
    if !params["genre"]["name"].empty?
      @song.genres << Genre.create(name: params["genre"]["name"])
    end

    if !!params[:song][:artist_id] && !params[:song][:artist_id].empty?
      @song.artist = Artist.find_by_id(params[:song][:artist_id][0])
      #binding.pry
    elsif !params["artist"]["name"].empty?
      @song.artist = Artist.create(name: params["artist"]["name"])
    else

    end
    @song.save
    erb :'/songs/show', locals: {message: "Successfully created song."}
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    #binding.pry
    erb :'/songs/edit'
  end

  #get '/owners/:id' do
    #@owner = Owner.find(params[:id])
    #erb :'/owners/show'
  #end

  post '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])

    if !params["song"]["name"].empty?
        @song.name = params["song"][song]
    end
    #binding.pry
    if !params["genre"]["name"].empty?
      @song.genres << Genre.create(name: params["genre"]["name"])
    end

    if !!params[:song][:artist_id] && !params[:song][:artist_id].empty?
      @song.artist = Artist.find_by_id(params[:song][:artist_id][0])
      #binding.pry
    elsif !params["artist"]["name"].empty?
      @song.artist = Artist.create(name: params["artist"]["name"])
    else

    end
    @song.save
    #binding.pry
    erb :'/songs/show', locals: {message: "Song successfully updated."}
  end
end