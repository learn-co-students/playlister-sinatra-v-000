# require_relative "application_controller"

class SongsController < ApplicationController
# binding.pry
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get 'songs/:slug'  do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

end
