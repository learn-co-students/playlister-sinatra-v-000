class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all

    erb :'artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    @songs = Song.all.where("artist_id = ?", @artist.id)
    @genres = []

    @songs.each do |s|
      #songgenre = SongGenre.all.where("song_id = ?", s.id).first
      #@genres << Genre.find(songgenre.genre_id)
      @genres << Genre.find(SongGenre.all.where("song_id = ?", s.id).first.genre_id) #Equivelent to above
    end

    @genres.uniq

    erb :'artists/show'
  end

end
