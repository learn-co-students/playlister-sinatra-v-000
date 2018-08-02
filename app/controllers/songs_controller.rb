class SongsController < ApplicationController

  get '/songs' do
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    @current_song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end
end
