class ArtistsController < ApplicationController

  get '/artists' do
    erb :'/artists/index'
  end

  post '/artists' do
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'/artists/show'
  end
end
