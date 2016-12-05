class SongsController < ApplicationController

  get '/songs' do
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    @song = Song.find_or_create_by(name: params[:Name])
    @artist = Artist.find_or_create_by(name: params[:"Artist Name"])
    @song.artist = @artist
    params[:genre].each do |genre|
      @genre = Genre.find_or_create_by(name: genre)
      @song.artist.genres << @genre
      @songgenre = SongGenre.create(:song_id => @song.id, :genre_id => @genre.id)
    end
    binding.pry
    erb :'/songs/:slug'
  end

end
