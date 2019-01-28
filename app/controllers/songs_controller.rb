class SongsController < ApplicationController
  
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index' 
  end
  
  get '/songs/new' do
    @songs = Song.all
    erb :'/songs/index' 
  end
  
  post '/songs' do 
    if !params[:artist][:name].empty?
      @song = Song.create(params[:song])
      @song.artist = Artist.find(:name => params["Artist Name"])
      @song.genres_ids = params[:genres]
      @song.save 
    end 
      
    flash[:message] = "Successfully created song."
    redirect to "songs/#{@song.id}"
  end
  
  get '/songs/:slug' do
    @songs = Song.all
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show' 
  end
  
  get '/songs/:slug/edit' do 
    @song = Song.create(params[:song])
    @song = Song.create(params[:song])
    erb :'/songs/edit'
  end
    
  patch '/songs/:id' do 
    @song = Pet.find(params[:id])
    @song.update(params[:pet])
      if !params[:artist][:name].empty?
        @song.owner = Artist.create(name: params[:artist][:name])
      end
    @song.save
    #?????#

    flash[:message] = "Successfully created song."
    redirect to "songs/#{@song.id}"
  end

  
end



