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
<<<<<<< HEAD
    erb :'/songs/edit'

  end

  post '/songs/:id' do

    @song = Song.find_by_slug(params[:id])
=======
    erb :'songs/edit'
  end

  patch '/songs/:id' do
    binding.pry
    @song = Song.find_by_slug(params[:id])

    redirect to "/songs/#{@song.slug}"
>>>>>>> 288c0f4efd0e07c8db669b3e900e0cca9c9fa950


    if Artist.find_by_name(params["Artist_Name"]) == nil
      @artist = Artist.create(name:params["Artist_Name"])
      @song.artist = @artist
    else
      @artist = Artist.find_by_name(params["Artist_Name"])
      @song.artist = @artist
    end
    binding.pry
    flash[:message] = "Successfully updated song."
    redirect to ("/songs/#{@song.slug}")
  end

end
