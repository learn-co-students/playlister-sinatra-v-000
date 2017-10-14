require 'pry'
class SongsController < ApplicationController

  get '/' do
    redirect '/songs'
  end

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end
end
