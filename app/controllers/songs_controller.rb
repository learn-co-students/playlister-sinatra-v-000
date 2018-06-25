class SongsController < ApplicationController

  get '/songs' do
    #binding.pry
    @songs = Song.all

    erb :'/songs/index'
  end


  get '/songs/new' do
    #binding.pry

    erb :'/songs/new'
  end

  get '/songs/:slug' do

    binding.pry

    @song = Song.find_by_slug(params[:slug])

    erb :'/songs/params[:slug]'
  end


end
