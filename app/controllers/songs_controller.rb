class SongsController < ApplicationController
    get '/songs' do 
        @songs = Song.all

        erb :"songs/index"
    end

    get '/songs/new' do
        

        erb :"songs/new"
    end

    post '/songs' do

        if Artist.find_by_name(params[:artist]) || Song.find_by_name(params[:name])
            redirect to '/error'          
        else
            new_artist = Artist.create(name: params[:artist])
            @song = Song.create(name: params[:name])
            @song.artist = new_artist
            @song.save
        end

        redirect to "/songs/#{@song.slug}"
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        
        erb :"songs/show"
    end

    
end