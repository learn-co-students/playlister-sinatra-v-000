class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :"/songs/index"
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :"/songs/new"
  end

  get '/songs/:slug' do
    #binding.pry
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end

  post '/songs' do
    @song = Song.create(name: params[:name])
    @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    @song.genre_ids = params[:genres]
    @song.save
    redirect "/songs/#{@song.slug}"
  end


end
