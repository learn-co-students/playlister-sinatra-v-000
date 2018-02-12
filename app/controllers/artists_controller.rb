class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb:'artists/index'
  end

  get '/artists/:slug' do
    @artist = artist.find_by_slug(params[:slug])
    if @artist
      erb:'artists/show'
    else
      redirect '/artists'
    end
  end
end
