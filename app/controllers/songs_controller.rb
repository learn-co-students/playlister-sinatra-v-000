
class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    # render songs index page
    #binding.pry
    erb :"songs/index"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    erb :"songs/show"
  end

end
