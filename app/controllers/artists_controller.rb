class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.all.find_by_slug(params[:slug])
    @songs = Song.all.find_all {|song| song.artist_id == @artist.id}
    @genres = Genre.all.find_all {|genre| genre.id == @artist.genre_id}

    erb :'artists/show'
  end

end
