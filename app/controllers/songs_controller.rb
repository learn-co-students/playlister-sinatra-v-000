class SongsController < ApplicationController
  get '/songs' do
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end


  # post '/songs/:slug' do
  #
  # end

  post '/songs' do
    @song = Song.create(name: params["name"])
    if !Artist.find_by(name: params["artist_name"])
      @song.artist = Artist.create(name: params["artist_name"])
    else
      @song.artist = Artist.find_by(name: params["artist_name"])
    end
    #binding.pry
    if !Genre.find_by(name: params["song"]["genre"])
      @song.genres << Genre.create(name: params["song"]["genre"])
    else
      @song.genres << Genre.find_by(name: params["song"]["genre"])
    end
    @song.save
    redirect to "/songs/#{@song.slug}"
  end

  post '/songs/:slug' do
    @song = Song.find_by(name: params["name"])
    if !Artist.find_by(name: params["artist_name"])
      @song.artist.update(Artist.create(name: params["artist_name"]))
    else
      @song.artist.update(Artist.find_by(name: params["artist_name"]))
    end
    if !Genre.find_by(name: params["song"]["genre"])
      @song.genres << Genre.create(name: params["song"]["genre"])
    else
      @song.genres << Genre.find_by(name: params["song"]["genre"])
    end
    @song.save
    redirect to "/songs/#{@song.slug}"
  end

end
