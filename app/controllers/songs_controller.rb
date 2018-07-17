class SongsController < ApplicationController

    get "/songs" do
        @songs = Song.all
        erb :"songs/index"
    end

    get "/songs/new" do
        @artists = Artist.all
        @genres = Genre.all
        erb :"songs/new"
    end

    get "/songs/:slug" do
        # currently possible to have duplicate slugs
        @song = Song.all.detect {|song| song.slug == params[:slug]}
        erb :"songs/show"
    end

    post "/songs" do
       
        @song = Song.create(name: params["song"]["name"])
       
        params["song"]["genre_ids"].each do |genre_id|
            @song.genres << Genre.find(genre_id.to_i)
        end

        if params["artist"]["name"]
            @artist = Artist.create(name: params["artist"]["name"])
            @song.artist = @artist
        else
            @artist = Artist.find(params["song"]["artist_id"])
            @song.artist = @artist
        end

        @song.save
        redirect "/songs/#{@song.slug}"
    end

end
