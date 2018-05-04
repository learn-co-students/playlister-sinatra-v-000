require 'pry'
class SongsController < ApplicationController


    get '/songs' do
      @songs = Song.all
      # model name followed by a method
      erb :'/songs/index'
    end

end
