class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
# puts "@song.name= #{@song.name}"
# puts "@song.artist.name= #{@song.artist.name}"
    erb :'/songs/show'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug/edit' do
    erb :'/songs/edit'
  end
end
