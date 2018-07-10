class SongsController < ApplicationController

  get '/songs' do
    @self = Song
    erb :index
  end

  get '/songs/:slug' do
    @instance = Song.find_by_slug(params["slug"])
    erb :show
  end

  get '/songs/new' do
    erb :new
  end

  post '/songs' do
  end

end
