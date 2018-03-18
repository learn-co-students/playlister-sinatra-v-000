class SongsController < ApplicationController
  # see helpers in ApplicationController
#========================================================== 
  get '/songs' do
    erb :'/songs/index'
  end
#==========================================================   
  get '/songs/new' do
    erb :'songs/new'
  end
#---------------------------------------------------------- 
  post '/songs' do
    @song = Song.find_or_create_by(name: params["Name"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save
    
    flash[:message] = "Successfully created song."
    
    redirect "/songs/#{@song.slug}" 
  end
#==========================================================   
  get '/songs/:slug/edit' do
    @song = find(params[:slug])
    
    erb :'songs/edit'
  end
#---------------------------------------------------------- 
  patch '/songs/:slug' do
    @song = find(params[:slug])
    
    @song.update(name: params[:Name]) 
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save
    
    flash[:message] = "Successfully updated song."
    
    redirect "/songs/#{@song.slug}"
  end
#==========================================================   
  get '/songs/:slug' do
    @song = find(params[:slug])
    
    erb :'songs/show'
  end
#========================================================== 
end

