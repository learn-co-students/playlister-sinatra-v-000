class ArtistsController < ApplicationController
  get '/artists' do
    @artists = Artist.all
    erb :'artists/index'
  end

  get '/artists/new' do
    binding.pry
    @artist = Artist.create(name: params[:name])
  end

  post '/artists/' do
  end

  get '/artists/:id' do
    @artist = Artist.find_by_slug(params[:id])
    erb :'artists/show'
  end

  get '/artists/:id/edit' do
  end

  patch '/artists/:id' do
  end

  put '/artists:id' do
  end

  delete '/artists/:id' do
  end
end
