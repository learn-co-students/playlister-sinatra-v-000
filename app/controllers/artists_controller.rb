class ArtistsController < ApplicationController

    get '/artists' do
        @artists = Artist.all
        erb :'artists/index'
    end

    post '/artists' do
        @artists = Artist.all
    end

    get '/artists/:slug' do
        @artist = Artist.find_by_slug(params[:slug])
        @songs = @artist.songs
        erb :'artists/show'
    end
end
