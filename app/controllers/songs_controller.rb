class SongsController < ApplicationController
  use Rack::Flash
  
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end
  
  get '/songs/:id' do 
    # raise params.inspect
    @song = Song.find(params[:id])
    erb :'/songs/show'
  end
  
end