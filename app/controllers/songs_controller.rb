require 'pry'

require 'rack-flash'
class SongsController < ApplicationController
  use Rack::Flash
  enable :sessions

  get '/songs' do
    @songs = Song.all

    erb :'songs/index'
  end

  get '/songs/new' do
    @song = Song.new
    @artists = Artist.all
    @genres = Genre.all
    @genre.save
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params["song"]["name"])
    if !params["artist"]["name"].empty?
      @song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
    end
    @song.genres << Genre.find_or_create_by(name: params["song"]["genres"])
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(:slug).first
    erb :"/songs/edit"
  end

  put '/songs/:slug' do
    @song = Song.find_by_slug(:slug).first
    if !params["artist"]["name"].empty?
      @song.artist = Artist.create(name: params["artist"]["name"])
    end
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end



  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end

end
