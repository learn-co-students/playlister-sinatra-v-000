class ArtistsController < ApplicationController
   get '/artists' do 
        @artists = Artist.all
        erb :'artist/artists'
   end 

   get '/artists/:slug' do 
        @artist = Artist.find_by_slug(params[:slug])
        erb :'artist/show'
   end
end
