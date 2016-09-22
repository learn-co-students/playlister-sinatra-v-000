class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @genres = @song.genres.collect {|s| s.name}
    erb :'/songs/show'
  end

  get 'songs/new' do

    erb :'/songs/new'
  end


end