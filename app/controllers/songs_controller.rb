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
    @song = Song.create(params[:song])
    if !params[:artist][:name].empty?
      @song.artist = Artist.create(name: params[:artist][:name])
    end
    @song.save
    #????????? flash ?????#
    redirect to "songs/#{@song.id}"
  end
  
  get '/songs/:slug' do
    @songs = Song.all
    #?????????#
    erb :'/songs/show' 
  end
  
  get '/songs/:slug/edit' do 
    #?????????#
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
    #????????? flash???#
    redirect to "songs/#{@song.id}"
  end

  
end



