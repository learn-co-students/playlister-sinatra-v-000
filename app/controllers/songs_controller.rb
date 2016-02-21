class SongsController < ApplicationController
  
  get "/songs" do 
    @songs = Song.all
    erb :"/songs/index"
  end
  
  get "/songs/:slug" do 
    @song = Song.find_by_slug(params[:slug].to_s)
    erb :"/songs/show"
  end
  
  
    
end