class SongsController < ApplicationController
  include Slugifiable

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params["song"])
    if !params["artist"]["name"].empty?
      @song.artist = Artist.find_by(name: params["artist"]["name"])
    end
    if !params["Artist Name"].empty?
      @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    end
    binding.pry
    if !params["genre"]["name"].empty?
      @song.genres << Genre.create(name: params["genre"]["name"])
    end
    params["song"]["genre_ids"].each do |id|
      @song.genres << Genre.find(id.to_i)
    end
    @song.save
    redirect to "/songs/#{@song.slug}"
  end

  post '/songs' do
    @song = Song.create(name: params["Name"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    if !params["genre"]["name"].empty?
      @song.genres << Genre.create(name: params["genre"]["name"])
    end
    params["song"]["genre_ids"].each do |id|
      @song.genres << Genre.find(id.to_i)
    end
    @song.save
    redirect to "/songs/#{@song.slug}"
  end

end
