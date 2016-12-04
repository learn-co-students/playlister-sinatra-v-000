

class ArtistsController < ApplicationController



get '/' do 
  @artists = Artist.all

  erb :'/artists/show'
end


end



