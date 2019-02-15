class SongsController < ApplicationController

    get '/songs' do
        #binding.pry
        @songs = Song.all
        erb :'songs/index'
    end
end

    
