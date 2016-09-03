class ArtistsController < ApplicationController

# artists route controller
  get '/artists' do
    @artists = Artist.all
    erb :'artists/index'
  end

  get '/artists/new' do
    erb :'artists/new'
  end

  get '/artists/:slug' do
    # Artist.find_by_slug(slug)
    redirect "artists/#{@artist.slug}"
  end

end
