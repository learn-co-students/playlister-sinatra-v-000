require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash
  
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end


  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/new' do
    binding.pry

    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params["Name"])
    
    if Artist.find_by(name: params["Artist Name"]).nil?
      @artist = Artist.create(name: params["Artist Name"])
      @song.artist = @artist
    else
      @song.artist = Artist.find_by(name: params["Artist Name"])
    end

    if params["genre_name"].empty?
      @song.song_genres = params[:genres]
    else
      @song.song_genres.create(genre: params[:genres])
    end
    @song.save
    
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do

  end

  post '/songs/edit/:slug' do
    @song = Song.create(name: params["Name"])
    if params["Artist Name"].empty?
      @song.artist = Artist.find(params[artist_id])
    else
      @artist = Artist.create(name: params["Artist Name"])
      @song.artist = @artist
    end

    if params["Artist Name"].empty?
      @song.artist = Artist.find(params[artist_id])
    else
      @artist = Artist.create(name: params["Artist Name"])
      @song.artist = @artist
    end
    @song.save

    @song.song_genres.create(genre: params["genre_id"])
    @song.artist = @artist

    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

end
