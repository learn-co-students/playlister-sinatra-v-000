class SongsController < ApplicationController


  get '/songs' do 
    @songs = Song.all

    erb :'/songs/index'
  end


  get '/songs/:slug' do
    @song = 
    
    erb :'/songs/show'
  end


  get '/songs/new' do 

  end


  get '/songs/:id/edit' do

  end


end


