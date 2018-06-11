class SongsController < ApplicationController
    get '/songs' do
        @songs = Song.all

        erb :'songs/index'
    end

    get '/songs/new' do
        @genres = Genre.all

        erb :'/songs/new'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])

        @success_message = ''
        if session[:just_created_new_song]
            @success_message = "Successfully created song."
            session[:just_created_new_song] = false
        end

        erb :'/songs/show'
    end

    post '/songs' do
        @artist = Artist.find_or_create_by(name: params[:artist_name])
        @genre = Genre.find_or_create_by(name: params[:genre_name])
        
        @song = Song.new
        @song.name = params[:name]
        @song.artist = @artist
        @song.genres << @genre
        @song.save

        session[:just_created_new_song] = true

        redirect to "/songs/#{@song.slug}"
    end
end