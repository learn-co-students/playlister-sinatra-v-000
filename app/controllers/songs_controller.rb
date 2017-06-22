class SongsController < ApplicationController

  get '/songs' do
    erb :'/songs/index'
  end

  get '/songs/:id' do
    erb :'/songs/:id/show'
  end


end
