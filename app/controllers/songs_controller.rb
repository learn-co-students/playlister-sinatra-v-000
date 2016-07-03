
class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    # render songs index page
    #binding.pry
    erb :"songs/index"
  end

end
