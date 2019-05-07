require 'rack-flash'
class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash
  
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
  
  post '/songs' do
    @song = Song.create(:name => params[:song_name])
    
    if !params[:new_artist].empty? && Artist.find_by(:name => params[:new_artist]).nil?
      @artist = Artist.create(:name => params[:new_artist])
    elsif !params[:new_artist].empty?
      @artist = Artist.find_by(:name => params[:new_artist])
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
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end
  
  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @artists = Artist.all
    @genres = Genre.all
    erb :'/songs/edit'
  end
  
  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:song_name]
    
    if !params[:new_artist].empty? && Artist.find_by(:name => params[:new_artist]).nil?
      @artist = Artist.create(:name => params[:new_artist])
    elsif !params[:new_artist].empty?
      @artist = Artist.find_by(:name => params[:new_artist])
    else
      @artist = Artist.find_by(:name => params[:existing_artist])
    end
    @song.artist = @artist
    
    @song.genres.clear
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
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end
  

end