class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    if !Artist.find_by_name(params["artist"]["name"])
      @artist = Artist.create(params["artist"])
    else
      @artist = Artist.find_by_name(params["artist"]["name"])
    end
    @song = Song.create(name: params["song"]["name"], artist: @artist)
    params["genres"].each do |genre_id|
      genre = Genre.find_by_id(genre_id)
      @song.genres << genre
    end
    @song.save
    flash[:message] = "Successfully created song."
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
    @song = Song.find_by_slug(params[:slug])
    if !Artist.find_by_name(params["artist"]["name"])
      @artist = Artist.create(params["artist"])
    else
      @artist = Artist.find_by_name(params["artist"]["name"])
    end
    @song.name = params["song"]["name"]
    @song.artist = @artist
    @song.genres.clear
    params["genres"].each do |genre_id|
      genre = Genre.find_by_id(genre_id)
      @song.genres << genre
    end
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

end
