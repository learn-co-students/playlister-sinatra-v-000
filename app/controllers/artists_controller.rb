class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    @a_songs = @artist.songs
    @a_genres = @artist.genres
    erb :'artists/show'
  end
end
