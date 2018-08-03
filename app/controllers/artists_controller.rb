class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :"artists/index"
  end

  get '/artists/:slug' do
    slug = params[:slug]
    @artist = Artist.find_by_slug(slug)
    erb :"artists/show"
  end
end
