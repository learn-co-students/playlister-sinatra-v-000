class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    # Any given artist's show page should have links to that artist's songs and genre.
    erb :'/artists/show'
  end

end