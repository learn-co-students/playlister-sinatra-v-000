require "pry"

class SongsController < ApplicationController

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    erb :'/songs/show'
  end

  get '/songs' do
    @songs = Song.all

    erb :'/songs/index'
  end

  get '/songs/:id' do
    @song = Song.find_by_id(params[:id])
    erb :'/songs/show'
  end

end
