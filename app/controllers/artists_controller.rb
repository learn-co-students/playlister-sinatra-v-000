class ArtistsController < ApplicationController
  use Rack::Flash

  get '/artists' do
    @artists = Artist.all
    
    erb :'artists/index'
  end


  get '/artists/:slug' do
    # raise params.inspect
    @artist = Artist.find_by_slug(params[:slug])
    # binding.pry
    erb :'artists/show'
  end

end
