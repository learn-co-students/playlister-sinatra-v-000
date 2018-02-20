class SongsController < ApplicationController

  get '/songs' do

  end

  get '/songs/:slug' do

  end

  get '/songs/new' do
    @genres = Genre.all
  end

end
