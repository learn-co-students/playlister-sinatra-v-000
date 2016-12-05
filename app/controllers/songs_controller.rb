class SongsController < ApplicationController

  get '/songs' do
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    #binding.pry
    erb :'/songs/show'
  end

end
