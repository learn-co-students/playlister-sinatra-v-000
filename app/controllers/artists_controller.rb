class ArtistsController < ApplicationController

    get '/artists' do
      erb :artists_view
    end

    get '/artists/:slug' do
      @artist = Artist.find_by_slug(params[:slug])
      @artistsongs = []
      Song.all.each do |song|
        if song.artist_id == @artist.id
           @artistsongs << song.name
        end
      end
      @genreartists = []
      Genre.all.each do |song|
        if genre.artist_id == @artist.id
           @genreartists << genre.name
        end
      end
      erb :actualartist
    end


end
