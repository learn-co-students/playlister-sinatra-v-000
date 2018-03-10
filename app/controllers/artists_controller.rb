class ArtistsController < ApplicationController

    get '/artists' do
        @artists = Artist.all
        erb :'/artists/artists'
    end

    get '/artists/:slug' do
        @artist.find_by_slug(params[:slug])
        erb :'/artists/show'
    end
    
end