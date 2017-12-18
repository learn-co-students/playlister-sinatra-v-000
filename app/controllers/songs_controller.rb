class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  # get '/songs/new' do
  #   erb :'/songs/new'
  # end

  get '/songs/:slug' do
    words = params[:slug].gsub(/[-]/, " ").split(" ").join(" ")
    @song = Song.find_by(name: words)
    erb :"/songs/show"
  end

end
