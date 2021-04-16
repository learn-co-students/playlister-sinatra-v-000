class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    @song = Song.find_or_create_by(name: params[:song_name])
    artist = Artist.find_or_create_by(name: params[:artist_name])
    params[:genres].each do |genre|
      genre = Genre.find_or_create_by(id: genre)
      @song.song_genres.build(genre: genre)
    end
    @song.artist = artist
    @song.save
    redirect to "songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by(name: params[:slug])
    erb :'songs/edit'
  end
end
