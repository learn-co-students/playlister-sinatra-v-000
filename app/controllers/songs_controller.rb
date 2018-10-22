require 'pry'
class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
   erb :'/songs/index'
  end

  get '/songs/new' do
  erb :'songs/new'
  end

  get '/songs/:slug' do
  @song = Song.all.find_by_slug(params[:slug])

  erb :'/songs/show'

  end




  post '/songs' do
    @song = Song.create(name: params["Name"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genre_id = params[:genres]
    @song.save

    redirect to :"/songs/#{@song.slug}"
  end





end
