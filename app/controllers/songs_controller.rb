require 'rack-flash'
require 'pry'

class SongsController < ApplicationController

  use Rack::Session::Cookie
  use Rack::Flash

  get '/songs' do
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
    #code for creating and saving a new song
    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end


end
