class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params["song"]["name"])
    @song.genre_ids = params["song"]["genre_ids"]
    @artist = Artist.find_or_create_by(name: params["artist"]["name"])
    @artist.songs << @song
    @song.save

    flash[:message] = "Successfully created song."

    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all

    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by(params[:id])
    @song.update(params[:song])
    @song.artist.update(params[:artist])

    flash[:message] = "Successfully updated song."

    redirect "/songs/#{@song.slug}"
  end
end
