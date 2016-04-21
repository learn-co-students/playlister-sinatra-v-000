class SongsController < ApplicationController

  get '/songs' do
    #session[:referrer] = request.referrer
    #@redirect = session[:referrer]
    @songs = Song.all
    #binding.pry
    erb :'/songs/index'
  end

  get '/songs/new' do
   #binding.pry
   #@song_genres = Genre.all.uniq

   erb :'/songs/new'
  end

  post '/songs' do
    #binding.pry
    session[:referrer] = request.referrer

    @redirect = session[:referrer]
    binding.pry
    @artist = Artist.all.find_or_create_by(name: params["Artist Name"])

    erb :'/songs/show'
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
    #binding.pry
    erb :'/songs/edit'
  end

end