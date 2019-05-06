class SongsController < ApplicationController
  
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end
  
  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'/songs/new'
  end
  
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end
  
  post '/songs/new' do
    @song = Song.create(:name => params[:song_name])
    
    if !params[:new_artist].empty?
      @artist = Artist.create(:name => params[:new_artist])
    else
      @artist = Artist.find_by(:name => params[:existing_artist])
    end
    @song.artist = @artist
    
    @genres = []
    if !params[:new_genre].empty?
      genre = Genre.create(:name => params[:new_genre])
      @genres << genre
    end
    
    if !params[:existing_genres].empty?
      params[:existing_genres].each do |g|
        genre = Genre.find_by(:name => g)
        @genres << genre 
      end
    end
    
    @genres.each {|g| @song.genres << g}
    
    @song.save
    redirect to "/songs/#{@song.slug}"
  end
  

end