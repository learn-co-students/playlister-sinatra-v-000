require 'pry'
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
    @song_genre = SongGenre.find_by(song_id: @song.id)
    erb :'/songs/show'
  end

  post '/songs' do
    binding.pry
    @song = Song.new(params)
    erb :'/songs/index'
  end
end