class ArtistsController < ApplicationController

  get '/artists' do
    @title = 'Playlister - Artists'
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    @title = '<%= @artist.name.capitalize %>'
    @artist = Artist.find_by_slug(params[:slug])
    erb :'artists/show'
  end
end
