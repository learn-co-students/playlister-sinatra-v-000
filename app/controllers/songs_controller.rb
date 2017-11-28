require 'pry'
require 'rack-flash'

class SongsController < ApplicationController

  enable :sessions
  use Rack::Flash

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    erb :'songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.artist = Artist.find_or_create_by(name: params[:song]["artist_name"])
    @song.genre_ids = params[:song]["genre_ids"]
    @song.save

    flash[:message] = "Successfully updated song."

    redirect to "songs/#{@song.slug}"
  end

  get '/songs/new' do
    @genres = Genre.all
    #binding.pry
    erb :'/songs/new'
  end

  post '/songs' do
    #binding.pry
    @song = Song.new(params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:artist]["artist_name"])
    #@song.genre_ids = params[:song]["genre_ids"]
    @song.save

    flash[:message] = "Successfully created song."

    redirect "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    erb :'songs/show'
  end

  get '/songs' do
    LibraryParser.parse
    erb :'songs/index'
  end
end
