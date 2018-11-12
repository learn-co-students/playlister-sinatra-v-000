class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:slug' do
    @slug = Song.find_by_slug(params[:slug].gsub("-"," "))
    @artist = Artist.find(@slug.artist_id)
    erb :'songs/show'
  end

  get '/songs/new' do
    erb :'songs/new'
  end
end
