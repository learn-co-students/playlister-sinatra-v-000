class SongsController < ApplicationController 

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.find_or_create_by(:name => params[:Name])
    @artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.artist = @artist
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    @genres = @song.genres
    erb :'/songs/show'
  end
end
