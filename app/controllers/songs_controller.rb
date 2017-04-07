class SongsController < ApplicationController

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

    @song = Song.create(params[:song])

    if Artist.find_by(name: params["artist"]["name"])
      artist = Artist.find_by(name: params["artist"]["name"])
      @song.artist_id = artist.id
    else
      artist = Artist.create(name: params["artist"]["name"])
      @song.artist_id = artist.id
    end

    if !params["genre_new"]["name"].empty?
      genre = Genre.create(name: params["genre_new"]["name"])
      @song.genres << genre
    end

    if !params[:genres].empty?

      params[:genres].each do |genre_id|
        genre = Genre.find(genre_id)
        @song.genres << genre
      end
    end

    @song.save
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'/songs/edit'
  end

  post '/songs/:slug' do

    redirect to "/songs/#{@song.slug}"
  end

end
