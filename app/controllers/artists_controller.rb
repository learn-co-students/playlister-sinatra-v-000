class ArtistController < ApplicationController
  
  get '/' do
    erb :'artists/index'
  end
  
  
end
