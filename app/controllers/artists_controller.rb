class ArtistsController < ApplicationController
  

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

   get '/artists/:slug' do
    @artist = Artist.find {|artist| artist.slug == params[:slug]}
    #@songs = @artists.songs
    #@genres = @artists.genres
    erb :'/artists/show'
  end

end
  

