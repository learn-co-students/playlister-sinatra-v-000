class ArtistsController < ApplicationController
  get '/artists' do
    @artists = Artist.all
    erb :'artists/index'
  end

  get '/artists/:slug' do
    slug = params[:slug]
    @artist = Artist.all.detect { |artist| artist.slug == slug}
    erb :'artists/show'
  end
end
