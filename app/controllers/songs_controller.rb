class SongsController < ApplicationController

    get '/songs/new' do
        erb :'/songs/new'
    end
    
    post '/songs' do
        # binding.pry
        @song = Song.create(:name => params["Song Name"])
        @artist = Artist.find_or_create_by(:name => params["Artist Name"])
        @song.artist_id = @artist.id
        @song.genre_ids << params[:genres]
        @song.save

        # flash[:message] = "Successfully created song."
        redirect "songs/#{@song.slug}"
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