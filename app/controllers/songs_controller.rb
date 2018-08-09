require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

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
      @artist = Artist.create(name: params[:artist_name])
      @song = Song.create(name: params[:Name])
      @song.artist = @artist
      @song.genre_ids = params[:genres]
      @song.save
    else
      @artist = Artist.find_by_name(params[:artist_name])
      @song = Song.create(name: params[:Name])
      @song.artist = @artist
      @song.genre_ids = params[:genres]
      @song.save
    end
     flash[:message] = "Successfully created song."
      redirect to ("/songs/#{@song.slug}")
  end

  get '/songs/:id/edit' do
    @song = Song.find_by_slug(params[:id])
    @genres = Genre.all
    erb :'/songs/edit'
  end

#  post '/songs/:id' do
#    @song = Song.find_by_slug(params[:id])
#    erb :'songs/edit'
#  end

  post '/songs/:id' do

    @song = Song.find_by_slug(params[:id])

    if Artist.find_by_name(params["Artist_Name"]) == nil
      @artist = Artist.create(name:params["Artist_Name"])
      @song.artist = @artist
    else
      @artist = Artist.find_by_name(params["Artist_Name"])
      @song.artist = @artist
    end
    flash[:message] = "Successfully updated song."
    redirect to ("/songs/#{@song.slug}")
  end

end
