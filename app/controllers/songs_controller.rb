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

  post '/songs' do
    @song = Song.create(name: params["Name"])
    if @artist = Artist.find_by(name: params["Artist Name"])
      @song.artist = @artist
    else
      @song.artist = Artist.create(name: params["Artist Name"])
    end
    @song.genre_ids = params[:genres]
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    # binding.pry
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    # binding.pry
    @genres = Genre.all
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(name: params["Name"], genre_ids: params[:genres])

    if params["Artist Name"] != ""
      if @artist = Artist.find_by(name: params["Artist Name"])
        @song.artist = @artist
      else
        @song.artist = Artist.create(name: params["Artist Name"])
      end
    end

    @song.save

    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

end
