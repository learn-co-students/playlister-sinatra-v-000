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

    post "/songs" do

        s = Song.new(params[:song])
        artist = Artist.find_or_initialize_by(name: params[:artist][:name])
        s.artist = artist
        flash[:message] = "Successfully created song."
        s.save ? redirect("/songs/#{s.name.to_slug}") : "failure"
    end

    get "/songs/:slug" do
        @song = Song.find_by_slug(params[:slug])
        erb :"songs/show"
    end

    get "/songs/:slug/edit" do
        @song = Song.find_by_slug(params[:slug])
        @artists = Artist.all
        @genres = Genre.all
        erb :"songs/edit"
    end

    patch "/songs/:slug" do
        s = Song.find_by_slug(params[:slug])
        s.update(params[:song])

        artist = Artist.find_or_initialize_by(name: params[:artist][:name])
        s.artist = artist

        flash[:message] = "Successfully updated song."
        s.save ? redirect("/songs/#{s.name.to_slug}") : "failure"
    end
end