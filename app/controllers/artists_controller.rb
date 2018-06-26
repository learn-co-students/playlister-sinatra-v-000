class ArtistsController < ApplicationController
  
  get '/' do
    erb '/artists/index'
  end
  
  
end
