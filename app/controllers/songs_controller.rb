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
    @artist = @song.artist
    @genres = Genre.all
    erb :'/songs/show'
  end

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  post '/songs' do
    #copy the rspec from failures to make prying easier.
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

    if !params["Genre Name"].empty? #&& !Genre.find_by(name: params["Genre Name"])
      @genre = Genre.create(name: params["Genre Name"])
      #@genre.save
      @song.genres << @genre
      @song.save
=begin
    elsif Genre.find_by(name: params["Genre Name"])
      @genre = Genre.find_by(name: params["Genre Name"])
      @song.genres << @genre
      @song.save
    else
=end
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
    if params["Artist Name"].empty?
    @artist = Artist.create(name: params["artist"]["name"])
    params["Artist Name"] = params["artist"]["name"] #bug fix regarding checks for a new blank name
    #if new name is blank, use old name
    end
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    #@song.artist.name = params["Artist Name"] not permanent, doesn't work.
      @song.artist.update(name: params["Artist Name"])
    @genre = Genre.find_by(name: params["genre_name"])

    #Genre.delete(@genre) wasn't needed
    params["genre_name"] = @song.genres.find_by(id: params["genre_ids"]).name
    #params["genre_name"] was the genre_name that needed to be changed
    #20+ tech coach sessions to figure this out
    @song.genres.find_by(id: params["genre_ids"]).update(name: params["genre_name"])
    #then params["genre_name"] updates specifically using the update method
    #the genre in the song that matches based on id
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to("/songs/#{@song.slug}")
  end
end
