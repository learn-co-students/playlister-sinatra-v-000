class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artists/new' do

  end

  post '/artists' do

  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'/artists/show'
  end

  get '/artists/:slug/edit' do

  end

  patch '/artists/:slug' do

  end
end
