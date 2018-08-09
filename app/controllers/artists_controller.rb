class ArtistsController < ApplicationController

  get '/artists' do
    @artist = Artist.new

  erb '/artists/index'
  end


  get '/artists/:slug' do
  end

end
