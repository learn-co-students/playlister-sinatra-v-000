require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash


  get '/songs' do
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  post '/songs/:id' do
    @song = Song.find(params[:id])
    @song.update(name: params["Name"])
    @artist = Artist.find_by(name: params["Artist Name"])
    if @artist == nil
      @artist = Artist.create(name: params["Artist Name"])
      @song.artist = @artist
      @song.save
    else
      @song.artist = @artist
    end
    @song.save
    flash[:message] = "Successfully updated song."

    redirect to "songs/#{@song.slug}"
  end

  post '/songs' do
    @song = Song.create(name: params["Name"])
    @artist = Artist.find_by(name: params["Artist Name"])
    @genre = Genre.find(params["genres"])
    @song.genres << @genre
    if @artist == nil
      @artist = Artist.create(name: params["Artist Name"])
      @song.artist = @artist
      @song.save
    else
      @song.artist = @artist
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "songs/#{@song.slug}"
  end
end
