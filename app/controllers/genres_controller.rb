class GenresController < ApplicationController

  get '/genres' do
    # list of all genres
    # each w/ clickable link
    # "Classical"
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/genres/:slug' do
    # genre's show page should have links for artists and each song association
    # "testing"
    @genre = Genre.find_by_slug(params[:slug])
    erb :'/genres/show'
  end
end
