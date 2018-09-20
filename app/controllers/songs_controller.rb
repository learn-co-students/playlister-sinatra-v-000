class SongsController < ApplicationController

  get '/songs/new' do
    erb :'songs/new'
  end
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end
  post '/songs' do
    @song = Song.create(name: params[:name])
    @song.artist = Artist.find_or_create_by(name: params[:name])
    @song.genre_ids = params[:genres]
    @song.save
    flash[:message] = "Song successfully created."
    redirect to '/songs/#{@song.slug}'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:slug])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.genre_ids = params[:genres]
    @song.save
    flash[:message] = "Song successfully updated."
    redirect to "/songs/#{@song.slug}"
  end
end
