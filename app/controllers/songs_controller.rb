class SongsController < ApplicationController
    get '/songs' do
        @songs = Song.all
        erb :'songs/index'
    end
    
    get '/songs/new' do
        @genres = Genre.all
        erb :'songs/new'
    end

    get '/songs/:slug/edit' do
        @genres = Genre.all
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/edit'
    end

    get '/songs/:id/edit' do
        @genres = Genre.all
        @song = Song.find_by_slug(params[:id])
        erb :'songs/edit'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
    end

    patch '/songs/:slug' do
        @genres = Genre.all
        @song = Song.find_by_slug(params[:slug])
        @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
        @song.update(params[:song])
        @song.genre_ids = params[:genres]
        @song.save
        redirect "/songs/#{@song.slug}"
    end



    post '/songs' do
        @song = Song.create(:name => params["Name"])
        @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
        @song.genre_ids = params[:genres]
        @song.save
    
        redirect to "/songs/#{@song.slug}"
    end
end