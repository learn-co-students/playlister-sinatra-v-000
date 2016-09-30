class SongsController < ApplicationController

  # Index action : Lists all songs in the library
  get '/songs' do 
    @songs = Song.all
    erb :"/songs/index"
  end

  get '/songs/new' do 
    erb :"/songs/new"
  end

  post '/songs' do 
    @song = Song.create(name: params["name"])
    @song.artist = Artist.find_or_create_by(name: params["artist"])
    @song.genre = params[:genres]
    @song.save

    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do 
    @songs = Song.find_by_slug(params[:slug])
      erb :"/songs/show"
  end
end