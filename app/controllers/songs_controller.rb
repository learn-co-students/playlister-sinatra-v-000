require 'pry'

class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

   get '/songs/new' do
     erb :'/songs/new'
   end

   get '/songs/:slug' do
     @song = Song.find_by_slug(parmas[:slug])
     erb :'/songs/show'
    end

    post '/songs' do
      @song = Song.create(name: params["name"])
      @song = Song.find_or_create_by(parmas["Artist Name"])
      @song.genre_ids = params[:genres]
      @song.save
      redirect to '/songs/show', locals: {message: "Successfully create song."}
    end

  get '/songs' do
    @song.update(name: params["name"])
  end



 end
