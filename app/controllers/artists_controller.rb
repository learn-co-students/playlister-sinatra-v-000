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
    if !params["pet"]["name"].empty?
    @artist.pets << Pet.create(name: params["pet"]["name"])
    end
    @artist.save
    redirect "artists/#{@artist.id}"
  end

  get '/artists/:slug/edit' do
    @artist = Artist.find(params[:id])
    erb :'/artists/edit'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'/artists/show'
  end

  post '/artists/:slug' do
      @artist = Artist.find(params[:id])
  @artist.update(params["artist"])
  if !params["pet"]["name"].empty?
    @artist.pets << Pet.create(name: params["pet"]["name"])
  end
  redirect to "artists/#{@artist.id}"
  end

end