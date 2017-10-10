class ArtistsController < ApplicationController

  get '/artists' do
    #Lists all artists
    #Artists will be clickable
    @artists = Artist.all
    erb :'artists/index'
  end

  get '/artists/new' do
    erb :'artists/new'
  end

  get '/artists/:slug' do
    #Lists all artists
    #Artists will be clickable
    @artist = Artist.all.find_by_slug(params[:slug])
    @genres = @artist.genres
    @songs = @artist.songs
    erb :'artists/show'
  end
end
