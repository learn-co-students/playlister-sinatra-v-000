class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  post '/songs' do
    @song = Song.create(name: params["Name"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @songs.genre_ids = params[:genre_ids]
    unless params["Genre Name"].empty?
      genre = Genre.find_or_create_by(name: params["Genre Name"])
      SongGenre.find_or_create_by(song_id: @song.id, genre_id: genre.id)
    end
    @song.save
    redirect :"/songs/#{@song.id}"
  end

  get '/songs/new' do
    erb :'/songs/new'
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
    @song.update(name: params["Name"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    binding.pry
    @songs.genre_ids = params[:genre_ids]
    unless params["Genre Name"].empty?
      genre = Genre.find_or_create_by(name: params["Genre Name"])
      SongGenre.find_or_create_by(song_id: @song.id, genre_id: genre.id)
    end
    @song.save
    redirect :"/songs/#{@song.id}", locals: {message: "Song successfully updated."}
  end
end