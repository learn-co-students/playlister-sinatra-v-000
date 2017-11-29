class SongsController < ApplicationController

  get '/songs' do
    @Songs = Song.all
    erb :'/songs/index'
  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(:slug)
    erb :'/songs/show'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end
end
