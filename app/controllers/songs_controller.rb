require 'rack-flash'

class SongsController < ApplicationController
    use Rack::Flash
    
    get "/songs" do
        @songs = Song.all
        erb :"songs/index"
    end

    get "/songs/new" do
        @genres = Genre.all
        @artists = Artist.all
        erb :"songs/new"
    end

    get "/songs/:slug" do
        @song = Song.find_by_slug(params[:slug])
        erb :"songs/show"
    end

    get "/songs/:slug/edit" do
        @song = Song.find_by_slug(params[:slug])
        @genres = Genre.all
        erb :"songs/edit"
    end

    patch "/songs/:slug" do
        @song = Song.find_by_slug(params[:slug])
        @song.update(params[:song])
        if !params[:genre][:name].empty?
            @song.genres << Genre.find_or_create_by(params[:genre])
        end

        if !params[:artist][:name].empty?
            @song.artist = Artist.find_or_create_by(params[:artist])
            @song.save
        end
        flash[:message] = "Successfully updated song."
        redirect "/songs/#{@song.slug}"
    end

    post "/songs" do
        @song = Song.create(params[:song])
        if !params[:genre][:name].empty?
            @song.genres << Genre.find_or_create_by(name: params[:genre][:name])
        end
        if !params[:artist][:name].empty?
            @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
            @song.save
        end
        flash[:message] = "Successfully created song."
        redirect "/songs/#{@song.slug}"
    end


end