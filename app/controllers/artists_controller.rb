class ArtistsController < ApplicationController

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    binding.pry
    erb :'/artists/show'
  end

end
