class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all

    erb :'/artists/index'
  end

  get '/artists/:slug' do
    #binding.pry
    artist = Artist.find_by_slug(params[:slug])
    @artist_name = artist.name
    @artist_songs = artist.songs
    @artist_song_ids = @artist_songs.collect {|song| song.id}
    @genre_ids = @artist_song_ids.collect {|id| SongGenre.find_by(id).genre_id}
    @artist_genres = @genre_ids.collect {|id| Genre.find_by(id).name }

    @artist_songs_slugged = @artist_songs.collect {|song| song.slug}

    erb :'/artists/show'
  end

end
