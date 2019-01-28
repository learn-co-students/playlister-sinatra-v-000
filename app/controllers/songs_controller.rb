class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    
    erb :'/songs/new'
  end

  post '/songs' do

    redirect "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    # binding.pry
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do

    erb :'/songs/edit'
  end

  patch '/songs/:slug' do

    redirect "songs/#{@song.slug}"
  end

end