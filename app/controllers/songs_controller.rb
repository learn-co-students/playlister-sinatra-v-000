class SongsController < ApplicationController
     
    get '/songs' do
        @songs = Song.all
        erb '/songs/index'
    end

    get '/songs/new' do
        erb '/songs/new'
    end

end
