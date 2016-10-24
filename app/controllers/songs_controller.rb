class SongsController < ApplicationController

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs' do
    
    @song= Song.create(params[:name])
    @song.save
    redirect :'songs/show'
  end

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:slug' do
    @song= Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

end
