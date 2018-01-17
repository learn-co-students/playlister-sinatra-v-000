class ArtistsController < ApplicationController

  get '/artists' do
    # This should present the user with a list of all artists in the library.
    # Each artist should be a clickable link to that particular artist's show page.
    @artists = Artist.all
    erb :'artists/index'
  end

  get '/artists/:slug' do
    # Any given artist's show page should have links to each of his or her songs and genres.
    @artist = Artist.find_by_slug(params[:slug])
    @songs = Song.find_by(artist_id: @artist.id)
    # binding.pry
    song_genres = SongGenre.find_by(song_id: @songs.id)
    @genre = Genre.find_by_id(song_genres.genre_id)
    erb :'artists/show'
  end



end
