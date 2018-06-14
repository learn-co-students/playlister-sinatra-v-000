class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artists/:name' do
    @artist = Artist.find_by_slug(params[:name])
    erb :'/artists/show'
  end

end
