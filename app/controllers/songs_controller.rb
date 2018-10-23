class ArtistsController < ApplicationController
  
  get '/songs' do
    @song = Song.all
     erb :index
  end
  
  post '/songs' do
    @song = Song.create(params[:song])
      if !params['artist']['name'].empty?
       @song.artist = Song.create(name: params['artist']['name'])
      end
    @song.save
    erb :'/songs/show'
  end
    
end