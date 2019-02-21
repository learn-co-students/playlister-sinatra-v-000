class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all
        erb :'songs/index'
    end

    get '/songs/new' do
        @genres = Genre.all
        erb :'songs/new'
    end

    post '/songs' do
        @song = Song.create(name: params[:song][:name])
        @song.artist = Artist.find_or_create_by(name: params[:song][:artist])
        @song.genre_ids = params[:song][:genres]
        @song.save

        flash[:message] = "Successfully created song."
        redirect to("/songs/#{@song.slug}")
    end

    get '/songs/:slug' do

        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
    end

    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @song.name = params[:song][:name]
        @song.artist = Artist.find_or_create_by(name: params[:song][:artist])
        @song.genre_ids = (params[:genres])
        @song.save

        flash[:message] = "Successfully updated song."
        redirect to("/songs/#{@song.slug}")

    end

        get '/songs/:slug/edit' do
            @song = Song.find_by_slug(params[:slug])
            erb :'/songs/edit'
        end

end
