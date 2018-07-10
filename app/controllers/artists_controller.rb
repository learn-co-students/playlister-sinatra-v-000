class ArtistsController < ApplicationController
  get '/artists' do
    erb :"artists/index"
  end

  get '/artists/:slug' do
    @artist = Artist.find(params[:id])
    erb :"artist/show"
  end
end
