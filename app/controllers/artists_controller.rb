class ArtistsController < ApplicationController

  get '/artists' do
    # list of all artists, each artist w/ clickable link
    # "Disclosure ft Lorde"
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    # artist's show page should have links for songs and each genre association
    # "testing"
    @artist = Artist.find_by_slug(params[:slug])
    erb :'/artists/show'
  end
end
