class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all.sort_by {|song| song.name}
    erb :'/songs/index'
  end
  
  get '/songs/new' do 
  	erb :'/songs/new'
  end
  
  post '/songs' do   
    @song = Song.create(:name => params[:name])
    artist = Artist.find_or_create_by(:name => params[:artist])
    
    params[:genres].each do |genre_id|
      @song.genres << Genre.find_by_id(genre_id)
    end
    @song.artist = artist
    @song.save
    erb :'/songs/show', locals: {message: "Successfully created song."}
  end
  
  get '/songs/:slug' do 
  	@song = Song.find_by_slug(params[:slug])
  	erb :'/songs/show'
  end
  
  post '/songs/:slug' do 
    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:name]
    @song.artist = Artist.find_or_create_by(:name => params[:artist])
    @song.genres = params[:genres].map do |genre_id|
      Genre.find_by_id(genre_id)
    end
    @song.save
    erb :'/songs/show', locals: {message: "Song successfully updated."}
  end
    
  
  get '/songs/:slug/edit' do 
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end
  
  
  
end

