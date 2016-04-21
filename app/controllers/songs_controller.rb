class SongsController < ApplicationController

  get '/songs' do
    #session[:referrer] = request.referrer
    #@redirect = session[:referrer]
    @songs = Song.all
    binding.pry
    erb :'/songs/index'
  end

  get '/songs/new' do
   #binding.pry
   #@song_genres = Genre.all.uniq

   erb :'/songs/new'
  end

  post '/songs' do
    #binding.pry
    # more testing with redirect in order 
    # to have index show when artist is successfully updated
    
    session[:referrer] = request.referrer

    @redirect = session[:referrer]
    binding.pry

    #artist_id = Song.all.
    #@song = Song.update(params) <<-- this will not work 
    #because Song.update will not update artist name
    
    #below is the code that should update my artist
    #Artist.all.find_by_id(artist_id.to_i).update(name: t)
    
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    #binding.pry
    #code below is for testing in order to 
    #have my index page know when a song was successfully updated
    session[:referrer] = request.referrer

    @song = Song.find_by_slug(params[:slug])
    @song_artist = Artist.all.find_by(:id => @song.artist_id)
    genre_id = SongGenre.all.find_by(:song_id => @song.id).genre_id
    @song_genre = Genre.all.find_by(:id => genre_id)

    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
  #edit the edit view

    session[:referrer] = request.referrer
    
    @song = Song.find_by_slug(params[:slug])
    binding.pry
    erb :'/songs/edit'
  end

end