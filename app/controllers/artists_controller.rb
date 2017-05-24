class ArtistsController < ApplicationController
  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.all.find {|instance| instance.slug == params[:slug]}
    erb :'/artists/show'
  end
end
