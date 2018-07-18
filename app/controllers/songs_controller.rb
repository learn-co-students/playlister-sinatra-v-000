require 'pry'
class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    if !params["song"]["name"].empty?
      @song = Song.create(name: params["song"]["name"])
    end
    @song.save
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    erb :'/songs/show'
  end

end
