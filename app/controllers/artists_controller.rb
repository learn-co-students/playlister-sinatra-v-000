class ArtistsController < ApplicationController

  get '/artists' do
    @artist = Artist.all
    
    erb :'/artists/index' 
  end

  get '/artists/:slug' do
  	@genres = []
  	@songs = []
  	
    @artist = Artist.find_by_slug(params[:slug])
    @songs << Song.find_by_id(@artist.song_ids)
    @genres << Genre.find_by_id(@artist.genre_ids)

    
    erb :'artists/show'
  end

  
end