class ArtistsController < ApplicationController
  use Rack::Flash

  get '/artists' do
    @artists = Artist.all
    
    erb :'artists/index'
  end


  get '/artists/:id' do
    # raise params.inspect
    @artist = Artist.find(params[:id])
    # binding.pry
    erb :'artists/show'
  end

end
