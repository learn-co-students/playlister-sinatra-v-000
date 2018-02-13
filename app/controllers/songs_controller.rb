class SongsController < ApplicationController

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    @artists = Artist.all

    erb :'/songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    @artist = Artist.find_by(name: params[:artist_name])
    @song.artist = !@artist ? Artist.create(name: params[:artist_name]) : @artist
    @song.save
    flash[:message] = "Successfully updated song."

    redirect to("/songs/#{@song.slug}")
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'/songs/new'
  end

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    @artist = Artist.find_by(name: params[:artist_name])
    @song.artist = !@artist ? Artist.create(name: params[:artist_name]) : @artist
    @song.save
    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end

end
