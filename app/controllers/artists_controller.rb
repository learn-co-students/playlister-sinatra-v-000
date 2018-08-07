class ArtistsController < ApplicationController

  get '/artists' do

    erb :'/'
  end

  get '/artists' do
  @artists = Artist.create(name: session[:name], song: session[:song], genres: session[:genres])
  erb '/artists/index'
  end


  get '/artists/:slug' do
  end

end
