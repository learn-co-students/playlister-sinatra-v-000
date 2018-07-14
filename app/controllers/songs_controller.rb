class SongsController < ApplicationController

  get '/songs' do
    @self = Song
    erb :index
  end

  get '/songs/new' do
    erb :new
  end

  post '/songs' do
    @song = Song.find_or_create_by(name: params["song_name"])
    if !params["artist_name"].empty?
      @artist = Artist.find_or_create_by(name: params["artist_name"])
      @song.artist_id = @artist.id
    end
    params["genres"].each {|genre| @song.genres << Genre.find_by_id(genre)}
    @song.save
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params["slug"])
    erb :edit
  end

  post '/songs/:slug' do
    @song = Song.find_or_create_by(name: params["song_name"])
    if !params["artist_name"].empty?
      @artist = Artist.find_or_create_by(name: params["artist_name"])
      @song.artist_id = @artist.id
    end
    @song.save
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @instance = Song.find_by_slug(params["slug"])
    erb :show
  end

end
