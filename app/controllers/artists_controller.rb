class ArtistsController < ApplicationController
  get '/artists' do
    @artists = Artist.all
    erb :'artists/index'
  end

  get '/artists/:slug' do
    @artist = find_by_slug(slug)
    erb :'/artists/show'
  end
end
