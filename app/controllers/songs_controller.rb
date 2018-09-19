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
  
end
