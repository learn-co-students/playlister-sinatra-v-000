class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    slug = params[:slug]
    @song = Song.all.detect { |song| song.slug == slug}
    erb :'songs/show'
  end
end
