class SongsController < ApplicationController
  
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end
  
  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end
  
  post '/songs' do
    @song = Song.create(params[:song])
    redirect "/songs/#{@song.slug}"
  end
  
  get '/songs/:slug/edit' do
    @genres = Genre.all
    @song = Song.find(params[:id])
    erb :'/songs/edit'
  end
  
  patch '/songs/:slug' do
    @song = Song.find(params[:id])
    @song.update(params["artist"])
    redirect "/songs/#{@song.slug}"
  end
  
end