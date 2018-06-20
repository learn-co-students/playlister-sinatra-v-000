class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.artist = Artist.find_by_id(@song.artist_id)
    erb :'/songs/show'
  end


  post '/songs' do

  end

  get '/songs/:slug/:edit' do

  end



  post 'songs/:slug' do

  end
end
