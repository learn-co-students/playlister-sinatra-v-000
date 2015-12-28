class ArtistController < ApplicationController

  get '/artists' do
    @artists = Artist.all.sort_by(&:name)
    erb :'artists/index'
  end
end
