class ArtistsController < ApplicationController

    # present the user with a list of all artists 
    # Each artist should be a clickable link to artist's show page.

    get '/artists' do
        @artists = Artist.all
    erb :"/artists/index"
    end

    # Any given artist's show page with links to artist's songs and genres.
    get '/artists/:slug' do
        @artist = Artist.find_by_slug(params[:slug])
        erb :"/artists/show"
    end
    
end