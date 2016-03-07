class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end
  get '/songs/new' do
    erb :'/songs/new'
  end
  post '/songs' do
    genre = Genre.find_or_create_by(params[:genre]) if !params[:genre][:name].empty?
    artist = Artist.find_or_create_by(params[:artist]) if !params[:artist][:name].empty?
    @song = Song.find_or_create_by(params[:song])
    @song.genre_ids = params[:genre_ids]
    @song.genres << genre if genre && !@song.genres.include?(genre)
    @song.artist = artist if artist
    @song.save
    erb :'/songs/show', locals: {message: "Successfully created song."}
  end
  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end
  patch '/songs/:slug' do
    genre = Genre.find_or_create_by(params[:genre]) if !params[:genre][:name].empty?
    artist = Artist.find_or_create_by(params[:artist]) if !params[:artist][:name].empty?
    @song = Song.find_or_create_by(params[:song])
    @song.genre_ids = params[:genre_ids]
    @song.genres << genre if genre && !@song.genres.include?(genre)
    @song.artist = artist if artist
    @song.save
    erb :'/songs/show', locals: {message: "Song successfully updated."}
  end
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

end
