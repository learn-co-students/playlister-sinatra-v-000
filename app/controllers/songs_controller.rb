class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
      if Artist.find_by(name: params[:artist_name]) == nil
        @artist = Artist.create(name: params[:artist_name])
      else
        @artist = Artist.find_by(name: params[:artist_name])
      end
      @song = Song.create(name: params[:song_name], artist_id: @artist.id)
      params[:genres].each do |genre|
        SongGenre.create(song_id: @song.id, genre_id: genre)
      end
      #binding.pry
      redirect "songs/#{@song.slug}"
    end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @genres = []
    @song.song_genres.each do |genre|
      @genres << Genre.find(genre.genre_id)
    end
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    #binding.pry
    @song = Song.find_by_slug(params[:slug])
    @genres = []
    @song.song_genres.each do |genre|
      @genres << Genre.find(genre.genre_id)
    end
    erb :'songs/edit'
  end

  post '/songs/:slug' do
    binding.pry
    @song = Song.find_by_slug(params[:slug])

    if Artist.find_by(name: params[:artist_name]) == nil
      @artist = Artist.create(name: params[:artist_name])
    else
      @artist = Artist.find_by(name: params[:artist_name])
    end

    @song.artist = @artist

  end

end
