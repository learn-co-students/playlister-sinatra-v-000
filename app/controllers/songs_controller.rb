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
    @song = Song.new(name: params[:song]["name"])
    if !params["artist"]["name"].empty?
      artist = Artist.create(name: params["artist"]["name"])
      @song.artist_id = artist.id
    end
    if !params["genre"]["name"].empty?
      @genre = Genre.create(name: params["genre"]["name"])
      @song.genre_id = genre.id
    end
    @song.genre = @genre
    @song.save
    redirect "/songs/#{@song.slug}"
    
    #     @song = Song.create(name: song_name)
    # @genre = Genre.create(name: genre_name)
    # @artist = Artist.create(name: artist_name)

    # @song.song_genres.create(genre: @genre)
    # @song.artist = @artist
  
    # @song.save
  end
  
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @genre = Genre.find_by(@song.genre_id)
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