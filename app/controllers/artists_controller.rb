class ArtistsController < ApplicationController

  get '/artists' do
    @self = Artist
    erb :index
  end

  get '/artists/:slug' do
    @instance = Artist.find_by_slug(params["slug"])
    erb :show
  end
end
