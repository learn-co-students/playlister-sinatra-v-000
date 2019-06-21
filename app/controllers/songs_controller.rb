class SongsController < ApplicationController
  
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end
  
  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end
 
  post '/songs' do
    @song = Song.new(params[:song])
    if !params["artist"]["name"].empty?
      artist = Artist.create(name: params["artist"]["name"])
      @song.artist_id = artist.id
    end
    if !params["genre"]["name"].empty?
      genre = Genre.create(name: params["genre"]["name"])
      @song.genre_id = genre.id
    end
    @song.save
    redirect "/songs/#{@song.slug}"
  end
  
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @genres = Genre.all
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end
  
  patch '/songs/:slug' do
    @song = Song.find(params[:id])
    @song.update(params["artist"])
    redirect "/songs/#{@song.slug}"
  end
  
end