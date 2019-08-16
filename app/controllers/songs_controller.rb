class SongsController < ApplicationController
  
  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
    # This helped with the syntax above: https://stackoverflow.com/questions/2129504/sinatra-sub-directory-views
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :"songs/new"
  end
  
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end

  post '/songs' do
    song = Song.new(params[:name])
    # song.genre_ids = params[:genres] Something's wrong here.
    song.artist = Artist.create(name: params[:artist_name])
    song.save
    #binding.pry
  end
  
end
