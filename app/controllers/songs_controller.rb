class SongsController < ApplicationController

  get '/songs' do
    # This should present the user with a list of all songs in the library.
    # Each song should be a clickable link to that particular song's show page.
    @songs = Song.all
    # binding.pry
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    # Any given song's show page should have links to that song's artist and the each genre associated with the song.
    # Pay attention to the order of /songs/new and /songs/:slug. The route /songs/new could interpret new as a slug if that controller action isn't defined first.
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_by_id(@song.artist_id)
    song_genres = SongGenre.find_by(song_id: @song.id)
    @genre = Genre.find_by_id(song_genres.genre_id)


    # binding.pry
    erb :'songs/show'
  end



end
