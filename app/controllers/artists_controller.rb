class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all

    erb :'/artists/index'
  end

  get '/artists/:slug' do
    @song = params[:slug]
    @artist = Artist.find_by_slug(@song)[0].name
    @genre = Genre.find_by_slug(@song)[0].name
    erb :'artists/show'
  end

end
