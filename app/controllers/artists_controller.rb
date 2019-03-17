class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all

    erb :'artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.all.find_by_slug(params[:slug])
    @artist_songs = @artist.songs
    @artist_genres = @artist.genres

    erb :'artists/show'
  end

end
