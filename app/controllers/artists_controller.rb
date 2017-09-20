class ArtistsController < ApplicationController
  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    @artist=Artist.find_by_slug(params[:slug])
    erb :'artists/show'
  end

  post '/artists' do

    #for creating new songs
  end

  get '/artists/:slug/edit' do

  end

  post '/artists/:slug' do
    #for updating a song
  end
end
