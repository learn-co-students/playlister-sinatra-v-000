class SongsController < ApplicationController

  get '/songs' do
    @title = 'Playlister - Songs'
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    @title = '<%= @song.name.capitalize %>'
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end
end
