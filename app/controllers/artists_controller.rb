class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artists/new' do

  end

  get '/artists/:slug' do

    words = params[:slug].gsub(/[-]/, " ").split(" ").join(" ")
    @artist = Artist.find_by(name: words)

    erb :'/artists/show'

  end



end
