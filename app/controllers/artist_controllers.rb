class ArtistControllers < ApplicationController
  get '/artists' do
    erb :'artists/view_all'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'artists/view'
  end
end
