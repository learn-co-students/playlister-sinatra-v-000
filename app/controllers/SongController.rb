class SongController < ApplicationController
 
  get '/songs' do
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
  	@song = Song.new(name: params["song"]["name"])
  	@song.genre_ids = params["genres"] 
  	@song.artist = Artist.find_or_create_by(name: params["artist"]["name"]) unless params["artist"]["name"].empty?	
  	@song.save
  	
    flash[:message] = "Successfully created song."
  	redirect to "/songs/#{@song.slug}"
  end
  
  get '/songs/:slug/edit' do
  	@song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post '/songs/:slug' do
  	@song = Song.find_by_slug(params[:slug])
    @song.name = params["song"]["name"] unless params["song"]["name"].empty?
    @song.genre_ids = params["genres"]
    @song.artist = Artist.find_or_create_by(name: params["artist"]["name"]) unless params["artist"]["name"].empty?
    @song.save 
     
    flash[:message] = "Successfully updated song." 
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
  	erb :'/songs/show'
  end

end
