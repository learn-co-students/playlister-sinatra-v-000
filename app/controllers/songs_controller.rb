# require 'rack-flash'

class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all
    erb:'/songs/index'
    end

    get '/songs' do
        if Song.find_by_slug(slug) == song.slug
            # then a new show page is made for each slug
        end
    erb:'/songs/show/#{song.slug}'
    end

end