class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    @artist_songs = Song.all.find_by_id(@artist.id)
    
    erb :'/artists/show'
  end
end
