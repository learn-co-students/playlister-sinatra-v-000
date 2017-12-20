class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    @song = find_by_slug(slug)
    erb :'/songs/show'
  end
end
