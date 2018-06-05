class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs/' do
    @post = Post.create(params)
    redirect to "/songs/#{@song.id}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.name = params([:name])
    @song.artist = params([:artist])
    @song.genre = params([:genre])
    @song.save
    redirect to '/songs/:slug'
  end
  #DON'T FORGET TO ADD HIDDEN PATCH LINE TO ERB FILE!!!!!!!

end
