class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :"artists/index"
  end

  get '/artists/:slug' do
    slug = params[:slug]
    #binding.pry
    @artist = Artist.find_by_slug(slug)
    @songs = @artist.songs.all
    @genres = @artist.genres.all
    #binding.pry
    erb :"artists/show"
  end

end
