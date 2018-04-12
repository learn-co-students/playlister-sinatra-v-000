class ArtistsController < ApplicationController

  get '/songs' do

  end

  get '/artists' do
    #displays a list of artists
    @artist = Artist.all
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    #displays the artist's songs
    #{"captures"=>[], "slug"=>"Artist"}
    # #<Artist:0x000000021d54f0 id: 1, name: "Artist">
    @artist = Artist.find_by_slug(params["slug"])
    erb :'/artists/show'
  end


end
