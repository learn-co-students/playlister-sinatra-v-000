class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs/' do
  end

  get '/songs/:id' do
    @song = Song.find_by_slug(params[:id])
    erb :'/songs/show'
  end

  get '/songs/:id/edit' do
  end

  patch '/songs/:id' do 
  end

  put '/songs/:id' do
  end

  delete '/songs/:id' do
  end
end