class ArtistsController < ApplicationController

  get '/artists' do
    @all_art = Artist.all
    erb :'/artists/index'
  end

  get "/artists/:slug" do
    @artist = Artist.find_by_slug(params[:slug])
    if @artist
      erb :'/artists/show'
    else
      redirect to "/artists"
    end
  end

end
