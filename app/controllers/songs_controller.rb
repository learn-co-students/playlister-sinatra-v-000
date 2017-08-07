class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  post '/songs' do
    @artist = Artist.find_or_create_by(name: params[:artist_name])
    @artist.songs.find_or_create_by(name: params[:name])
    @song = @artist.songs.last
    @song.genre_ids = params[:genres]
    @song.save
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])

    erb :'/songs/show'
  end

end
