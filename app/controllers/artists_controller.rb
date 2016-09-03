class ArtistsController < ApplicationController

# artists route controller
  get '/artists' do
    @artists = Song.all
    erb :'artists/index'
  end

  get '/artists/new' do
    erb :'artists/new'
  end

  get '/artists/:slug' do
    redirect "artists/#{@artist.slug}"
  end

end
