class SongsController < ApplicationController
  
  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
    # This helped with the syntax above: https://stackoverflow.com/questions/2129504/sinatra-sub-directory-views
  end
  
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end
  
end
