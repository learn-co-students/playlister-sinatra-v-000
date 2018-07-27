class ArtistsController < ApplicationController
    get '/artists' do
        @artist = Artist.all
        
        erb :'artist/index'
    end

    get '/artists/:slug' do
        @artist = Artist.find_by_slug(params[:slug])
        
        erb :'artist/show'
    end
end
