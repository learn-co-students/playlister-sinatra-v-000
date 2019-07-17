class SongsController < ApplicationController

  get '/songs' do
    erb :"/songs/index"
  end

  post '/songs' do
    @song = Song.create(params)

    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/new' do
    erb :"/songs/new"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find(@song.artist_id)
    @genres = @song.songs_genres
    erb :"/songs/show"
  end


end
