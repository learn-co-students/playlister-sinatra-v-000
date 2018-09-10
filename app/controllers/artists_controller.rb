class ArtistsController < ApplicationController

  get '/artists' do
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    if @artist
      erb :"artists/show"
    end
  end
end
