class ArtistsController < ApplicationController

    get '/artists' do #index
        @artists = Artist.all
        erb :"/artists/index"
    end

    get '/artists/:slug' do #show
        @artist = Artist.find_by_slug(params[:slug]) 
        erb :"/artists/show"
    end

    
end
