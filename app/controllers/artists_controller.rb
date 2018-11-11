class ArtistsController < ApplicationController

  get '/artists' do
     @artists = Artist.all
     erb :'artists/index'
  end

  get '/artists/:slug' do
    @slug = Artist.find_by_slug(params[:slug].gsub("-"," "))
    erb :'artists/show'
  end

end
