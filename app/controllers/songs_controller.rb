class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:slug' do
    #binding.pry
    @song = Song.find_by_slug(params[:slug])

    # I expect to use the find_by_slug class method
    erb :'songs/show'
  end
  #
  # get '/songs/:id' do
  #   binding.pry
  #   @song = Song.find(params[:id])
  #   erb :'songs/show'
  # end
end
