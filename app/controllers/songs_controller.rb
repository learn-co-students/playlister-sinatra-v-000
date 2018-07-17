class SongsController < ApplicationController

    get "/songs" do
        @songs = Song.all
        erb :"songs/index"
    end

    get "/songs/new" do
        @artists = Artist.all
        erb :"songs/new"
    end

    get "/songs/:slug" do
        # currently possible to have duplicate slugs
        @song = Song.all.detect {|song| song.slug == params[:slug]}
        erb :"songs/show"
    end

end
