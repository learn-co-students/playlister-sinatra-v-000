
class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    # render songs index page
    erb :"songs/index"
  end

end
