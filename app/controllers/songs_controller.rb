class SongController < ApplicationController

  get '/songs' do
    @songs = Songs.all
    erb :'songs/index'
  end
  
  get 'songs/new' do
  end
  
  get 'songs/:slug' do 
  end
  
end