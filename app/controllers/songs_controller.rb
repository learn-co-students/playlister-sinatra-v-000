require 'pry'

class SongsController < ApplicationController


     get '/songs' do
      @songs = Song.all
      # model name followed by a method
      erb :'/songs/index'
    end


    get '/songs/:slug' do
     @song = Song.find_by_slug(params[:slug])  # slug helps to find by name instaed of ID
     # model name followed by a method
     erb :'/songs/show'
    end

end
