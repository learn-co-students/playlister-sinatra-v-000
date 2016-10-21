class SongsController < ApplicationController

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(slug: slug)
    erb :'songs/show'
  end

end
