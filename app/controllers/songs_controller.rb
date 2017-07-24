class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all

    erb :'/songs/index'
  end

  get '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    @song_name = song.name
    @song_artist = Artist.find_by(:id => song.artist_id)
    @song_artist_name = @song_artist.name
    genre_id = SongGenre.find_by(:id => song.id).genre_id
    @song_genre = Genre.find_by(:id => genre_id)
    @song_genre_name = @song_genre.name
    @song_artist_slugged = @song_artist.slug
    @song_genre_slugged = @song_genre.slug

    erb :'/songs/show'
  end

end
