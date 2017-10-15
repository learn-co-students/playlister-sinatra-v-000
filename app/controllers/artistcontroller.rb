class ArtistController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'artists/artistlist'
  end

  get '/artists/:slug' do
    erb 
  end
end
