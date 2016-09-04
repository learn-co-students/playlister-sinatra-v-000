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
    @song = Song.find_by_slug(params[:slug])
     erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post '/songs' do
    binding.pry

    @song = Song.create(name: params["Name"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.genre = Genre.find_or_create_by(name: params[:genres])
    @song.save

    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  post "songs/:slug" do
  @song = Song.find_by_slug(params[:slug])
  @song.update(params[:song])
  @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
  @song.save

  flash[:message] = "Successfully created song."
  redirect to "/songs/#{@song.slug}"
  end

end
