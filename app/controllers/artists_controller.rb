class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'artists/index'
  end

  get '/artists/:name_slug' do
    @artist = Artist.find_by_slug(params[:name_slug])
    erb :"artists/show"
  end

end
