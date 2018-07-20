class ArtistsController < ApplicationController

 get '/artists' do
   @songs = Song.all
   @artists = Artist.all
   @genres = Genre.all
   erb :index
 end

end
