class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all

    erb :'/songs/index'
  end

  get '/songs/new' do

   erb :'/songs/new'
  end

  patch '/songs/:slug' do
    @redirect = session[:referrer]
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song = Song.find_or_create_by(artist_id: @artist.id)
    
    @song.save

    erb :'songs/show', locals: {message: "Song successfully updated."}
    #erb :'/songs/show'
  end

  post '/songs' do
    #binding.pry
    session[:referrer] = request.referrer
    
    @redirect = session[:referrer]
    #binding.pry
    @song = Song.find_or_create_by(name: params["Name"])
    @artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song_genre = SongGenre.find_or_create_by(genre_id: params["genres"].first)
    @song.artist_id = @artist.id
    @song.save
    @artist.save

    erb :"/songs"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song_artist = Artist.find_by(:id => @song.artist_id)
    @song_genre = Genre.find_by(:id => @song.id)

    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    session[:referrer] = request.referrer
    @redirect = session[:referrer]

    @song = Song.find_by_slug(params[:slug])

    erb :'/songs/edit'
  end

end