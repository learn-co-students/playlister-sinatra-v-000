#require 'rack-flash'


class SongsController < ApplicationController
  #use Rack::flash
  
  get '/songs' do
    @songs = Song.All
    erb :'/songs/index'
  end
  
  get '/songs/new' do
    erb :'/songs/new'
  end
  
  
  
end