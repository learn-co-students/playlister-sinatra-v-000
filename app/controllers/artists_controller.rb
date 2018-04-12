class ArtistsController < ApplicationController
  get '/artists' do
    @artists = Artists.all
    erb :'artists/index'
  end

  get '/artists/:slug' do
    @artists = Artists.find_by_slug(params[:slug])
    erb :'artists/show'
  end
end
