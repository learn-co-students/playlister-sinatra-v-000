class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end


  get '/artists/:slug' do

    @art = Artist.find_by_slug(params[:slug])
    if @art.nil?
        @art = Artist.find_by_name(params[:slug])
    end
    erb :'/artists/show'
  end


end
