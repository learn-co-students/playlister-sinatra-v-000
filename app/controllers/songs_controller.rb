class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  post '/songs' do
    @song = Song.create(name: params["Name"])
    @song.artist = Artist.find_or_create_by(name: params[:"Artist Name"])
    params["genres"].each do |g|
      @song.genres << Genre.find_by_id(g)
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect "songs/#{@song.slug}"
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post '/songs/edit' do
    @song = Song.find_or_create_by(name: params[:"Name"])
    @song.artist = Artist.find_or_create_by(name: params[:"Artist Name"])
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

end
