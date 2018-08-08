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
    erb :'/songs/show'
  end

  post '/songs' do
    if Artist.find_by_name(params[:artist_name]) == nil
      artist = Artist.create(name: params[:artist_name])

      @song = Song.create(name: params[:Name])

      @song.artist = artist
      @song.save

    else
      artist = Artist.find_by_name(params[:artist_name])
      @song = Song.create(name: params[:Name])
      @song.artist = artist
      @song.save
    end
     redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:id/edit' do
    @song = Song.find_by_slug(params[:id])
    erb :'songs/edit'
  end

  patch '/songs/:id' do

    @song = Song.find_by_slug(params[:id])
    params

  end

end
