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

  patch '/songs/:slug' do #patch is a form of post
    if !params.keys.include?("genre_ids") #genre_ids and artists shouldn't be in songs it should be sepereate
    params["genre_ids"] = []
    end
    #bug fix ^
    #binding.pry
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    @song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
    binding.pry
    @song.genres = Genre.find_or_create_by(id: params["genre_ids"])
    # if !params["artist"]["name"].empty?                            not needed like last lab
    #@artist = Artist.create(name: params["artist"]["name"])
    #@song.artist = @artist
    @song.genre_ids = params[:genres] #will work plural
    @song.save
    #end
    flash[:message] = "Successfully updated song."
    redirect to("/songs/#{@song.slug}")
  end

end
