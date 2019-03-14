class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
   erb :'/songs/index'
  end

  get '/songs/:id' do
    @song = Song.find_by_slug(params[:id])
    # binding.pry
    erb :"/songs/show"
  end


end
