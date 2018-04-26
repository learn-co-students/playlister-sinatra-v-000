require 'pry'
class SongsController < ApplicationController


    get '/songs' do
      @song = Song.all
      # model name followed by a method
      erb :'/songs/index'

    end
end
