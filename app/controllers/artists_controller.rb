class ArtistsController < ApplicationController


  get '/artists/new' do
    @artists = Artist.all
    erb :'artists/index'
  end

  post '/artists' do
    #binding.pry
    artist = Artist.new(params[:id])
    artist.name = params[:name]
    artist.save
    redirect "/artists/#{artist.id}"
  end

  get '/artists/:id' do
    @artist = Artist.find(params[:id])
    erb :'artists/show'
  end
end
