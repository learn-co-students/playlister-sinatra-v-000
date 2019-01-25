class ArtistsController < ApplicationController

  get '/artists' do
    # Present the user with a list of artists in the library
    # Each artist should be a clickable link to that particular artist's show page
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    # Any given artist's show page should have links to that artist's songs and genre.
    erb :'/artists/show'
  end

end