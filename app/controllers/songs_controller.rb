class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all
        erb :'songs/index'
    end

    get '/songs/new' do
        erb :'songs/new'
    end

    post '/songs' do

    end
    
    get '/songs/:slug' do

    end

    get '/songs/:slug/edit' do

    end

    patch '/songs/:slug' do
        
    end

end

