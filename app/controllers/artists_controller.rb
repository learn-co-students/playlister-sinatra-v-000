class ArtistsController < ApplicationController
  get '/artists' do
    @artists = Artist.all.sort_by {|artist| artist.name}
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    @artist_songs = @artist.songs.sort_by{|song| song.name}
    @artist_genres = @artist.genres.sort_by{|genre| genre.name}
    erb :'/artists/show'
  end
end
