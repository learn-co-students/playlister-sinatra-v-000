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
        elsif session[:just_updated_song]
            @success_message = "Successfully updated song."
        end

        session[:just_created_new_song] = false
        session[:just_updated_song] = false

        erb :'/songs/show'
    end

    get '/songs/:slug/edit' do
        @genres = Genre.all
        @song = Song.find_by_slug(params[:slug])

        erb :'/songs/edit'
    end

    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])

        @artist = Artist.find_or_create_by(name: params[:artist_name])
        @genre = Genre.find_or_create_by(name: params[:genre_name])

        @song.artist = @artist

        @song.genres.clear
        @song.genres << @genre

        @song.save

        session[:just_updated_song] = true

        redirect to "/songs/#{@song.slug}"
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