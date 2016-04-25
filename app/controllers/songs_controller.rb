class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all

    erb :'/songs/index'
  end

  get '/songs/new' do

   erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song_genre = Genre.find_by(:id => @song.id)

    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    erb :'/songs/edit'
  end

  post '/songs' do
    #binding.pry
    @song = Song.find_or_create_by(name: params["Name"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    #@song.genre_id = params[:genres]
    @song.genre_id = params[:song][:genre_id]
    @song.update(params[:song])

    erb :"/songs"
  end

  patch '/songs/:slug' do
    @song = Song.find_or_create_by(artist_id: @artist.id)
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    #may have to assign genre ids to song from params song genre id
    @song.update(params[:song])

    erb :'songs/show', locals: {message: "Song successfully updated."}
  end

end