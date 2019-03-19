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

    #if !params["artist"]["name"].empty?
    #@artist = Artist.create(name: params["artist"]["name"])
    #@song.artist = @artist
    #end
    #bug fixes ^
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    #@song.artist.name = params["Artist Name"] not permanent, doesn't work.
    @song.artist.update(name: params["Artist Name"])
    if params["Artist Name"] = ""
    @artist = @song.artist.update(name: params["Artist Name"])
    end
    @song.genres << Genre.find_by(name: params["genre_names"][0])
      #this was hard, you needed to pry and exit till your reach the error
      #iterator was needed because it was each.
      #params revealed ids were a string
    #value of params["genre_ids"] is an array of ["1"]
    #genre_id.to_i becaus eparams revealed ids were a string
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to("/songs/#{@song.slug}")
  end

end
