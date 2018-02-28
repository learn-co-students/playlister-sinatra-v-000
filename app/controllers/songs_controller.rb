class SongsController < ApplicationController

  # ----- INDEX -----

  get '/songs' do
    erb :'/songs/index'
  end

  # ----- READ -----

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end


end
