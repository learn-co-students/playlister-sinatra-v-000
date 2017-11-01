class SongsController < ApplicationController

  get '/songs' do
    # binding.pry
    @songs = Song.all
    erb :'./songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    binding.pry
    erb :'./songs/show'
  end

end
