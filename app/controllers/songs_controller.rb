class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    #binding.pry
    erb :'/songs/index'
  end

  get '/songs/new' do
   #binding.pry
   #@song_genres = Genre.all.uniq

   erb :'/songs/new'
  end

  patch '/songs/:slug' do
    session[:referrer] = request.referrer
    
    @redirect = session[:referrer]
    @artist = Artist.all.find_or_create_by(name: params["Artist Name"])
    @artist.name ? nil : @artist.update(name: params["Artist Name"])
    
    @song = Song.all.find_or_create_by(artist_id: @artist.id)

    erb :'/songs/show'
  end

  post '/songs' do
    #binding.pry
    #@song.artist = Artist.all.find_or_create_by(name: params["Artist Name"])

    session[:referrer] = request.referrer
    
    @redirect = session[:referrer]
    #binding.pry
    @song = Song.all.find_or_create_by(name: params["Name"])
    #@song.artist_id ? nil : @song.update(artist_id: @artist.id)
    @song.save
    
    @song_genre = SongGenre.find_or_create_by(genre_id: params["genres"])
    @song_genre.song_id ? nil : @song_genre.update(song_id: @song.id)

    if @artist == Artist.all.last
      redirect to "/songs/#{@song.slug}"
    else
      redirect to "/songs"
    end
  end

  get '/songs/:slug' do
    session[:referrer] = request.referrer
    #binding.pry

    @song = Song.find_by_slug(params[:slug])
    @song_artist = Artist.all.find_by(:id => @song.artist_id)
    #binding.pry
    genre_id = SongGenre.all.find_or_create_by(:song_id => @song.id).genre_id
    @song_genre = Genre.all.find_by(:id => @song.id)

    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do

    session[:referrer] = request.referrer
    
    @song = Song.find_by_slug(params[:slug])
    #binding.pry
    erb :'/songs/edit'
  end

end