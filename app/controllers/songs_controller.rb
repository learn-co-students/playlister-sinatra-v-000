require 'pry'
require 'rack-flash'
require 'rack/flash/test' # => https://github.com/nakajima/rack-flash/issues/1

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
    erb :'songs/show'
  end

  post '/songs' do
    # binding.pry
    @song = Song.create(params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully created songs."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song]) # instead of using create
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    # binding.pry
    if !params[:genres][:name].empty? # not an empty genre
      @song.genre_ids = params[:genres]
    end
    @song.save

    redirect to "/songs/#{@song.slug}"
  end
end