require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  post '/songs' do
    @song = Song.new
    @song.name = params[:name]
    if Artist.all.find {|artist| artist.name == params[:name] }.nil?
      artist = Artist.new(params[:artist_name])
      @song.artist = artist
    else
      @song.artist = params[:artist]
    end
    @song.genre = params[:genre]
  # ^ code for creating and saving a new song
    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/new' do
    erb :new
  end

end
