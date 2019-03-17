require 'pry'
require 'rack-flash'
class SongsController < ApplicationController
  use Rack::Flash
  get '/songs/new' do
    @songs = Song.all
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs' do
    binding.pry
    @songs = Song.all
    erb :'/songs/index'
  end

  post '/songs' do
    @song = Song.create(params[:song])

    if !params["Artist Name"].empty? && !Artist.find_by(name: params["Artist Name"])
      @artist = Artist.create(name: params["Artist Name"])
      #@artist.save
      @song.artist = @artist
      @song.save
      #@artist.songs << @song
    elsif Artist.find_by(name: params["Artist Name"])
      @artist = Artist.find_by(name: params["Artist Name"])
      @song.artist = @artist
      @song.save
    else
    end

    if !params["Genre Name"].empty?
      @genre = Genre.create(name: params["Genre Name"])
      #@genre.save
      @song.artist = @artist
      @song.save
      #@genre.songs << @song
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    @genres = Genre.all
    erb :"/songs/edit"
  end

  patch '/songs/:slug/edit' do
    if !params[:song].keys.include?("artist_id")
      params[:song]["artist_id"] = []
    end

    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    if condition

    end
    flash[:message] = "Successfully updated song."
    redirect to()"/songs/#{@song.slug}")
  end

end
