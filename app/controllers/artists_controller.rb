require 'pry'
class ArtistsController < ApplicationController
  
  get '/artists' do
    @artists = Artist.all
    erb :'artists/index'
  end
  
  get '/artists/:slug' do
    @artists = Artist.find_by_slug(params[:slug])
    erb :'/artists/show'
  end
  
end
