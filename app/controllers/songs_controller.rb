require 'rack-flash'
require 'pry'

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
    @song = Song.create(:name => params["Name"])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.genre_ids = params[:genres]

    @song.save

    flash[:message] = "Successfully created song."

    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/edit"
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    if params["Artist Name"] != nil && params["Artist Name"] != "" && params["Artist Name"] != " "
      @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    end
    @song.genre_ids = params[:genres]
    @song.save
    #binding.pry
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

end
