require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    @song = Song.create(name: params["Name"])
    if !params["Artist Name"].empty?
      @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    end
    if !params["genres"].empty?
      @song.genre_ids = params["genres"]
    end
    @song.save

    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    # @song = Song.find_by_slug(params[:slug])
    binding.pry
    # @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    # @song.update(params[:song])
    # @song.save

    # flash[:message] = "Successfully updated song."
    # redirect "/songs/#{@song.slug}"
  end
end
