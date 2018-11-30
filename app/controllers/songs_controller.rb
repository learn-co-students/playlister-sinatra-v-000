class SongsController < ApplicationController

  get '/songs' do
    erb :'songs/index'
  end

  get '/songs/:slug' do
    slug = params[:slug]
    @song = Song.find_by_slug("#{slug}")
    erb :'songs/show'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs/new' do
    @song = Song.create(params[:song])
  end

end
