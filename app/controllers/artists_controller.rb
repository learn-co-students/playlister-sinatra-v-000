class ArtistsController < ApplicationController
  get "/artists" do
    # instance variables
    @artists = Artist.all

    # view
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    # instance variables
    @artist = Artist.find_by_slug(params[:slug])
    @songs = @artist.songs
    @genres = @artist.genres

    # view
    erb :'/artists/show'
  end
end
