class ArtistsController < ApplicationController

  get "/artists/new" do

  end

  get "/artists/:slug" do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'artists/show'
    # binding.pry
  end

  get "/artists" do
    @artists = Artist.all
    erb :'/artists/index'
  end
end
