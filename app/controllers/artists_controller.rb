class ArtistsController < ApplicationController

  get '/' do
    erb :index
  end

  get '/artists' do
    erb :'artists/index'
  end

  get '/artists/:slug' do
    #need to turn the slug into an id
    @artist = Artist.find_by_id(params[:id])
    erb :'artists/show'
  end
end
