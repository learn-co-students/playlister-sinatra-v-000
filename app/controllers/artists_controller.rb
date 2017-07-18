class ArtistsController < ApplicationController

  get '/artists' do
    @category = Artist
    erb :show_category
  end

  get '/artists/:slug' do
    if Artist.find_by_slug(params[:slug])
      @item = Artist.find_by_slug(params[:slug])
      erb :show_item
    end

  end

end