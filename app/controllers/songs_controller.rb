require 'pry'
require 'rack-flash'

class SongsController < ApplicationController

  use Rack::Flash

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    erb :'songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.artist.name = params["song"]["artist_name"] unless params["song"]["artist_name"] == ""
    @song.save

    flash[:message] = "Successfully updated song."

    redirect to "songs/#{@song.slug}"
  end

  get '/songs/new' do

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
