class ArtistController < ApplicationController

  get '/artists' do
    @artists = Artist.all.sort_by(&:name)
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.all.find_by_slug(params[:slug])
    erb :'/artists/show'
  end
end
