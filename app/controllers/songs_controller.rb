require 'rack-flash'

class SongsController < ApplicationController
    use Rack::Flash

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
       
        @song.genre_ids = params["song"]["genre_ids"]
      
        # possible to refactor this so that we only set one artist name
        if params["artist"]["name"] != ""
            @artist = Artist.find_or_create_by(name: params["artist"]["name"])
            @song.artist = @artist
        else
            @artist = Artist.find(params["song"]["artist_id"])
            @song.artist = @artist
        end
        @song.save

        flash[:message] = "Successfully created song."
        redirect "/songs/#{@song.slug}"
    end

end
