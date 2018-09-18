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
    @song = Song.create(name: params[:name])
    if !params[:new_artist_name].blank?
      @artist = Artist.create(name: params[:new_artist_name])
      @song.artist = @artist
    else
      @artist = Artist.find_by(params[:artist_name])
      @song.artist = @artist
    end
    redirect "/songs/#{@song.slug}"
  end
end
