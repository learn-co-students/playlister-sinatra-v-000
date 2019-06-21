class ArtistsController < ApplicationController
  
  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end
  
  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    @songs = Song.all
    @genre_songs = []
    erb :'/artists/show'
  end
  
end