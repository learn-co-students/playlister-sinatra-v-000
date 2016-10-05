class ArtistController < ApplicationController

  get '/artists' do
    erb :'artists/artist_index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'/artists/artist_show'
  end

end
