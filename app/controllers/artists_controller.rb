class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    @song = Song.find_by_name(@artist.songs.first.name)
    @genre = Genre.find_by_name(@artist.genres.first.name)
    #binding.pry
    erb :'/artists/show'
  end
end
