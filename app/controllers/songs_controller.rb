class ArtistsController < ApplicationController
  enable :sessions
  use Rack::Flash
  
  get '/songs' do
    @song = Song.all
     erb :index
  end
  
  get '/songs/new' do
    @song = Song.create(params[:song])
    erb :'/songs/new'  
  end
  
  get '/songs/:slug' do
    
  end
  
  patch '/songs/:slug' do
  
end
  
  post '/songs' do
    @song = Song.create(params[:song])
      if !params['artist']['name'].empty?
       @song.artist = Song.create(name: params['artist']['name'])
       elsif !params['genre']['name'].empty?
       @song.genre = Song.create(name: params['genre']['name'])
      end
    @song.save
    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
    erb :'/songs/show'
  end
  
  get '/songs/:slug/edit'
  
  end
    
end