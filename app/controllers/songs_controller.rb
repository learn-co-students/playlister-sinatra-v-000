class SongsController < ApplicationController

  get '/songs' do
  #  @song=Song.new
    erb :'/songs/index'
  end

  get '/songs/:slug' do

  end

end
