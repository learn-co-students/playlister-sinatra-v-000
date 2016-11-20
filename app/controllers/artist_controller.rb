class ArtistController < ApplicationController

  get '/artists' do
    erb :'/artists/index' # displays list of artists
  end

  # Redirects to the artists page
  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])

    erb :'artists/show' # displays information about an artist
  end
end