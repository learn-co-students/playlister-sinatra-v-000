class SongsController < ApplicationController
end


 get '/songs' do
    @songs = Song.all
    erb '/songs/index'
 end
