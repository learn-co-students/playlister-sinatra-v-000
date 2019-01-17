class SongsController < ApplicationController
  
  get '/songs' do 
    @songs = Song.all 
    
    erb :'/songs/index'
  end
  
  get '/songs/new' do
    
    erb :'/songs/new'
  end
  
  get '/songs/:slug' do 
    @song = Song.find_by_slug(params[:slug])
    
    erb :'/songs/show'
  end
  
  post '/songs/new' do
    @song = Song.create(:name => params[:song][:name])
    
    # if !Artist.all.include?(name: params[:artist][:name])
    #   @song.artist = Artist.create(name: params[:artist][:name])
    # else  
    #   @song.artist.name = Artist.find_by_name(name: params[:artist][:name])
    # end
    @song.artist = Artist.find_or_create_by(:name => params[:artist][:name])
    @song.genre_ids = params[:genres]
    @song.save 
    
    flash[:message] = "Successfully created song."
 
    redirect to "/songs/#{@song.slug}"
  end
  
  
   get '/songs/:slug/edit' do 
    @song = Song.find_by_slug(params[:slug])
    
    erb :'/songs/edit'
  end
  
  patch '/songs/:slug' do 
    @song = Song.find_by_slug(params[:slug])
    
    @song.update(params[:song])
    @song.artist = Artist.find_or_create_by(:name => params[:artist][:name])
    @song.genre_ids = params[:genres]
    @song.save 
    
    flash[:message] = "Successfully updated song."
    
  redirect("/songs/#{@song.slug}")
  end
  
end