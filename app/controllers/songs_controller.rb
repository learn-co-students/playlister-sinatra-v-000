class SongsController < ApplicationController 
  
  get '/songs' do 
    @songs = Song.all 
    erb :'/songs/index'
  end

  get '/songs/:slug' do 
  	@song = Song.find_by_id(params[:slug])
  	erb :show 
  end 



end 