require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash


  get '/songs' do
    @songs = Song.all

    erb :'songs/index'
  end

  post '/songs' do

    # Create new song
    song = Song.create(name: params[:song][:name])

    # Create or find artist
    if !params[:song][:artist].empty?
      artist = Artist.new(name: params[:song][:artist])
      if Artist.find_by_slug(artist.slug)
        artist = Artist.find_by_slug(artist.slug)
      else
        artist.save
      end
    end

    # Get Genre objects for selected genres
    genres = params[:song][:genres]
    genres.map! {|genre| Genre.find(genre)}

    # Add genres and artist to song and save
    song.genres = genres
    song.artist = artist
    song.save

    # flash message
    flash[:message] = "Successfully created song."
    redirect "/songs/#{song.slug}"
  end

  get '/songs/new' do

    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    @genres = @song.genres

    erb :'songs/show'

  end

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])

    # Create or find artist
    if !params[:song][:artist].empty?
      artist = Artist.new(name: params[:song][:artist])
      if Artist.find_by_slug(artist.slug)
        artist = Artist.find_by_slug(artist.slug)
      else
        artist.save
      end
    end

    # confirm genres included in hash
    if !params[:song].keys.include?("genres")
      params[:song][:genres] = []
    end

    # Get Genre objects for selected genres
    genres = params[:song][:genres]
    genres.map! {|genre| Genre.find(genre)}

    song.genres = genres
    song.artist = artist
    song.save

    # flash message
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    erb :'songs/edit'
  end

end
