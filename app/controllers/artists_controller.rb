class ArtistsController < ApplicationController

  get '/artists' do
    # This should present the user with a list of all artists in the library.
    # Each artist should be a clickable link to that particular artist's show page.
    @artists = Artist.all
    erb :'artists/index'
  end

  get '/artists/:slug' do
    # Any given artist's show page should have links to each of his or her songs and genres.
    erb :'artists/show'
  end



end
