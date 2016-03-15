class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do 
    erb :'songs/new'
  end

  get '/songs/:slug/edit' do 
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  get '/songs/:slug' do 
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs/:slug' do 
    artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song = Song.find_by_slug(params[:slug])
    artist.songs << @song unless artist.songs.include?(@song)
    params["genres"].each do |genre_index|
      SongGenre.create(genre_id: genre_index, song_id: @song.id)
    end
    erb :'songs/show', locals: {message: "Song successfully updated."}
  end

  post '/songs' do 
    artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song = Song.create(name: params["Name"], artist: artist)
    artist.songs << @song
    params["genres"].each do |genre_index|
      SongGenre.create(genre_id: genre_index, song_id: @song.id)
    end
    erb :'songs/show', locals: {message: "Successfully created song."}
  end
end