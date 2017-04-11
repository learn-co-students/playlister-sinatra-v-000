class ArtistsController < ApplicationController
  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  post '/artists' do
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    #binding.pry
    erb :'/artists/show'
  end
end
