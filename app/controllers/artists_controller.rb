class ArtistsController < ApplicationController

  get "/artists" do
    @artists = Artist.all
    erb :"/artists/index"
  end

  get "/artists/:slug" do
    @artist = Artist.create(params[:artist]) #[:plug]
    erb :"/artists/show"
  end
end
