class SongsController < ApplicationController
  
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end
  
  get '/songs/new' do

    erb :"/songs/new"
  end
  
  post '/songs' do
    @song = Song.new(name: params[:song][:name])
    @song.artist = Artist.find_or_initialize_by(params[:song][:artist])
    genre = Genre.find_by name: params[:song][:genres][0][:name]
    genre.songs << @song
    @song.save
    
    flash[:new_message] = "Successfully created song."

    redirect "/songs/#{@song.slug}" 
  end
  
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
  
    @song = Song.find_by_slug(params[:slug])
    
    
    erb :'/songs/edit'
  end
  
  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    #@song.update(params[:song])
    
    flash[:update_message] = "Successfully updated song."
    erb :"/songs/#{@song.slug}"
  end
  
end