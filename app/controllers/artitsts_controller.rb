class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :index
  end

  get '/artists/:slug' do
    @artist= Artist.find_by_slug(params[:slug])
    erb :'/artists/edit'
  end
  

end
