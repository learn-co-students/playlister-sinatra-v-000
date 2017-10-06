class SongsController < ApplicationController

    get '/songs/new' do
        erb :'/songs/new'
    end
    
    post '/songs/:slug' do
        @song = Song.create(params[:song]["name"])
        @artist = Artist.create(params["song"]["artist"])
        @song.artist = @artist
        params["song"]["genre"] << @song
        
        redirect to '/songs/:slug'
    end

    get '/songs/:slug/edit' do
        erb :'/songs/edit'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @artist = @song.artist
        @genres = @song.genres
        erb :'/songs/show'
    end

    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
    end
end