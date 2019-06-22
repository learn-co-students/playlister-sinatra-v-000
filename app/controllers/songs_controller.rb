class SongsController < ApplicationController
  
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end
  
  get '/songs/new' do
    @genres = Genre.all
    @artists = Artist.all
    erb :'/songs/new'
  end
 
  post '/songs' do
    @song = Song.create(name: params[:song]["name"])
    if !params["genre"]["name"].empty?
      genre = Genre.find_or_create_by(name: params["genre"]["name"])
    end
    if !params["artist"]["name"].empty?
      artist = Artist.find_or_create_by(name: params["artist"]["name"])
      @song.artist_id = artist.id
      @song.artist = artist
    end
    @song.save
    @song.song_genres.build(genre: genre)
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