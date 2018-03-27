class SongsController < ApplicationController

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs/new' do
    artist = Artist.create(name: params[artist_name])
    song = Song.create(name: params[song_name], genre: params[genres][])
    artist.songs << song
    redirect_to '/songs/:slug'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_or_create_by(name: params[artist_name])
    params[genres][].each do |g|
      @songs.genres << g
    end
    @artist.songs << @song
    @artist.save
    render '/songs/show'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

end
