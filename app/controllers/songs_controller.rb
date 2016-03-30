class SongsController < ApplicationController

  get '/songs' do 
    
    @songs = Song.all 
    
    erb :'songs/index'
  end 

  get '/songs/new' do

    erb :'songs/new'
  end 

  post '/songs/new' do 
    @song = Song.find_or_create_by(name: params[:song][:name])
    @artist = Artist.find_or_create_by(name: params[:song][:artist_name])
    params[:song][:genre_ids].each do |g|
      @song.genres << Genre.find(g.to_i)
    end
    @song.update(artist: @artist, genres: @song.genres)
    redirect '/songs'
  end 

  get '/songs/:slug' do
   
    @song = Song.find_by_slug(params[:slug])
   
    erb :'songs/show' 
  end 

  get '/songs/:slug/edit' do

      @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end 

  post '/songs/:slug' do
   
    @song = Song.find_by_slug(params[:slug])
    @song.artist = Artist.find_or_create_by(name: params[:song][:artist_name])
   
    if params[:song][:genre_ids] != nil 
      params[:song][:genre_ids].each do |g|
        @song.genres << Genre.find(g)
      end 
    end 
    @song.save

    redirect "/songs/#{@song.slug}"
  end 



end 