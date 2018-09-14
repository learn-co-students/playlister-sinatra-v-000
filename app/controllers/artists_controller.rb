class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    # binding.pry
    erb:'/artists/index'
end

get '/artists/:slug' do
binding.pry
  @artist = Artist.find_by_slug(params[:slug])

  erb :'artists/show'
end
end
