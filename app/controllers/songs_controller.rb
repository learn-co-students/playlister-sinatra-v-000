class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    @song=Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    #for creating new songs
  end

  get '/songs/:slug/edit' do

  end

  post '/songs/:slug' do
    #for updating a song
  end

end
