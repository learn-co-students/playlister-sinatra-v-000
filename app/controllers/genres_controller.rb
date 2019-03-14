class GenresController < ApplicationController
   get '/genres' do 
        @genres = Genre.all
        erb :'genre/genres'
   end 

   get '/genres/:slug' do 
        @genre = Genre.find_by_slug(params[:slug])
        erb :'genre/show'
   end
end