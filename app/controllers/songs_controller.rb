class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end
  
  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end
  
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end
  
  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'/songs/edit'
  end
  
  post '/songs' do
    @song = Song.create(:name => params[:name])

    if Artist.find_by_name(params[:artist])
      @song.artist = Artist.find_by_name(params[:artist])
    else
      @song.artist = Artist.create(:name => params[:artist])
    end
    
    genres = params[:genres]
    genres.each do |genre|
      @song.genres << Genre.find(genre.to_i)
    end
    
    @song.save
    redirect to "/songs/#{@song.slug}"
  end
  
  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    artist_name = params[:artist]
    
    if !!Artist.find_by(:name => artist_name)
      @song.artist = Artist.find_by(:name => artist_name)
    else
      @song.artist = Artist.create(:name => artist_name)
    end
    
    @song.genres.clear
    genres = params[:genres]
    genres.each do |genre|
      @song.genres << Genre.find(genre)
    end
    @song.save
    
    redirect to "/songs/#{@song.slug}"
  end
  
end