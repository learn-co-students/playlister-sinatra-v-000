class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs/new' do
    @artist = Artist.find_by_name(params[:artist])
    @artist ||= Artist.new(params[:artist])
    @song = Song.find_by_name(params[:song][:name])
    @song ||= Song.new(params[:song][:name])
    @song.artist = @artist

    # puts params
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

end
