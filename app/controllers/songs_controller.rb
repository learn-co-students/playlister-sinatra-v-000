class SongsController < ApplicationController

  get '/songs' do
    erb :show
  end

  get '/songs/:slug' do
    erb :index
  end

end
