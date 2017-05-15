class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    
    erb :'/genres/index' 
  end

  get '/genres/:slug' do
  	@artists = []
  	@songs = []
  	
  	
    @genre = Genre.find_by_slug(params[:slug])
    @songs << Song.find_by_id(@genre.song_ids)
    @artists << Artist.find_by_id(@genre.artist_ids)
    
    erb :'genres/show'
  end


  
end