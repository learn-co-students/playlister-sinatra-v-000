class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all

    erb :'songs/index'
  end

  get '/songs/:id' do
    @song = Song.find(params[:id])
    erb :'songs/show'
  end

  get '/songs/new' do
    @songs = Song.all
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])


    redirect "/songs/#{@song.id}"
  end

  get '/songs/:id/edit' do
    @song = Song.find(params[:id])
    erb :'songs/edit'
  end

  post '/songs/:id' do
    @song = Song.find(params[:id])
    @song.update(params[:song])


    redirect "/songs/#{@song.id}"
  end
end
