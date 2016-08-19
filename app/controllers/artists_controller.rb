class ArtistsController < ApplicationController

  get '/artists' do
    @title = 'Playlister - Artists'
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    @title = "#{@artist.name.capitalize}"
    erb :'artists/show'
  end
end
