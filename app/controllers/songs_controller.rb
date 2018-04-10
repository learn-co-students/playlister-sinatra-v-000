require 'rack-flash'
class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all

    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all


    flash[:message] = "Successfully created song."

    erb :'songs/new'
  end

  post '/songs/:slug' do
    song = Song.create(name: params["song_name"])
    song.genre_ids = params["genre"]

    # song = Song.find_by(name: params["song_name"]) || Song.find_by(name: params["Song Name"]) #new addition
    # genre = Genre.find_by(name: params["genre"]) || Genre.find_by(name: params["genre"]["name"]) #new addition

    artist = Artist.find_by(name: params["artist_name"]) || Artist.find_by(name: params["Artist Name"])

    if !artist
      new_artist = Artist.create(name: params["artist_name"])
      song.artist = new_artist
      song.save
      new_artist.save
    else
      song.artist = artist
      song.save
      artist.save
    end

    # genre = Genre.find_by(id: params["genre"]) #WORKING ON
    #FYI TO SELF: trying to update genre.name from 'New Age Garbage' to 'Hippity Hop'

    redirect "/songs/#{song.slug}" #moves to GET '/songs/:slug'
  end

  get '/songs/:slug' do
    slug = params["slug"]
    @song = Song.find_by_slug(slug)

    flash[:message] = "Successfully created song."
    erb :'songs/show'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all

    flash[:message] = "Successfully created song."
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.artist.name = params["Artist Name"]
    @song.save

    flash[:message] = "Successfully updated song."

    erb :'songs/show'
  end


end
