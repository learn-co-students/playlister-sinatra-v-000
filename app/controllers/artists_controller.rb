class ArtistsController < ApplicationController
  get '/artists' do
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    # using dynamic attribute-based finder #find_by_attribute

    @artist = Artist.find_by_slug(params[:slug])
    erb :'/artists/show'
  end
  
end