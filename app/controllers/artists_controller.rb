class ArtistsController < ApplicationController
"artists controller"

  get '/artists' do
    #binding.pry
    erb :'/artists/index'
  end

  get '/artists/show' do
    erb :'/artists/show'
  end

  get '/artists/:slug' do
    @artist = Artist.all.find{ |artist| artist.slug == params["slug"]}
      erb :'/artists/show'
  end

end
