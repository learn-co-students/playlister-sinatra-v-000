class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all

    erb :'/songs/index' 
  end


  get '/songs/:slug' do
  	@genres = []
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_by_id(@song.artist_id)
    @genres << Genre.find_by_id(@song.genre_ids)

    
    erb :'songs/show'
  end

  
end