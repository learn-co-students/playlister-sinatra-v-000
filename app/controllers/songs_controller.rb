# require 'rack-flash'

class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all
    erb:'/songs/index'
    end

    get '/songs/:slug' do
        #HOW CAN THE PROGRAM RECOGNIZE :SLUG AS AN ID?
        @song = Song.find_by_slug(params[:slug])
    erb:'/songs/show'
    end
end

