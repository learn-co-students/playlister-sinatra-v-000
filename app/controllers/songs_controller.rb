class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
      @song = Song.create(params[:song])
      if !params["artist"]["name"].empty?
        @song.artist = Artist.create(name: params["artist"]["name"])
      end
      @song.save
      redirect "songs/@song.slug"
    end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @genres = []
    @song.song_genres.each do |genre|
      @genres << Genre.find(genre.genre_id)
    end
    erb :'songs/show'
  end

end
