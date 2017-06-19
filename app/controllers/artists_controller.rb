class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artists/new' do
    erb :'/artists/new'
  end

  post '/artists' do
    @artist = Artist.create(params[:artist])
    redirect "artists/#{@artist.id}"
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    @songs = @artist.songs.all

    erb :'artists/show'
  end

end
