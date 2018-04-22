class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    @songs = []
    Song.all.each do |song|
      if @artist.id == song.artist_id
        @songs << song
      end
    end
    @genres = []
    @songs.each do |song|
      song.song_genres.each do |genre|
        @genres << Genre.find(genre.genre_id)
      end
    end
    erb :'artists/show'
  end

end
