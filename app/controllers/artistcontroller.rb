class ArtistController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'artists/artistlist'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    @songs = @artist.songs
    @genres = @artist.genres
    erb :'artists/show'
  end
end
