class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    @song = Song.find_by(artist_id: @artist.id)
    @genre = Genre.find_by_id(SongGenre.find_by(song_id: @song.id).genre_id)
    erb :'/artists/show'
  end
end # ArtistsController
