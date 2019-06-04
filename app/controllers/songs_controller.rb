require 'sinatra/base'
require 'sinatra/flash'

class SongsController < ApplicationController
  enable :sessions
  register Sinatra::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    genre = Genre.find(params[:genre][:id])
    @song.genres << genre

    if Artist.find_by(name: params[:artist][:name])
      @song.artist = Artist.find_by(name: params[:artist][:name])
    else
      @song.artist = Artist.create(params[:artist])
    end

    @song.save

    flash[:message] = "Successfully created song."

    redirect "songs/#{@song.slug}"
  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end
end
