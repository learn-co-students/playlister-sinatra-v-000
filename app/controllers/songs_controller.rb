require 'pry'
class SongsController < ApplicationController

  # songs route controller
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    redirect "songs/#{@song.slug}"
  end

end
