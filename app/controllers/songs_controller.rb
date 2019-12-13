class SongsController < ApplicationController
    
    get '/songs' do 
        @songs = Song.all
        erb :'songs/index'
    end

    get '/songs/new' do 
        erb :'/songs/new'
    end

    post '/songs' do
        song = Song.new(:name => params[:song_name])
        song.artist = Artist.find_or_create_by(:name => params[:artist_name])
        song.genres << params[:genres].collect {|g| Genre.find(g)}
        song.save

        flash[:message] = "Successfully created song."

        redirect "/songs/#{song.slug}"
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end

end