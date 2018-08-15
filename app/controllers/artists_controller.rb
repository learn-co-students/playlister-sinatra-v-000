class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'artists/index'
  end

  get '/artists/:slug' do
    if @artist = Artist.find_by_slug(params[:slug])
      @genres = @artist.songs.map{|s| s.genres}.flatten.uniq
      erb :'artists/show'
    else
      @artists = Artist.all
      erb :'artists/index'
    end
  end
end
