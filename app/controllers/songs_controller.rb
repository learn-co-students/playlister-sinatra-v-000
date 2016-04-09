class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    @artist = Artist.find_or_create_by(params[:artist])
    @artist.songs << @song
    params[:genre_ids].each do |genre_id|
      SongGenre.create({genre_id: genre_id, song_id: @song.id})
    end
    erb :'/songs/show', locals: {message: "Successfully created song."}
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    @artist = Artist.find_or_create_by(params[:artist])
    @artist.songs << @song
    SongGenre.where(song_id: @song.id).destroy_all
    params[:genre_ids].each do |genre_id|
      SongGenre.find_or_create_by({genre_id: genre_id, song_id: @song.id})
    end
    erb :'/songs/show', locals: {message: "Song successfully updated."}
  end
end
