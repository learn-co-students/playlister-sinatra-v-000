class GenresController < ApplicationController

  get '/genres' do
    erb :genres_view
  end

   
   get '/genres/:slug' do
     @genre = Genre.find_by_slug(params[:slug])
     erb :actualgenre
   end

end
