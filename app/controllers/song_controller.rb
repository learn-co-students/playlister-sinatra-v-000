require 'rack-flash'
require "rack/flash/test"
class SongController < ApplicationController
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions
    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
    end

    post '/songs' do
        @artist = Artist.find_or_create_by(name: params["Artist Name"])
        @song = Song.create(name: params["name"])
        @song.genre_ids = params["genres"]
        @song.artist = @artist
        @song.save
        flash[:message] = "Successfully created song."
        redirect "/songs/#{@song.slug}"
    end

    patch '/songs/:slug' do
        patch '/songs/:slug' do
            @song = Song.find_by_slug(params[:slug])
            @song.update(params[:song])
            @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
            @song.save
        
            flash[:message] = "Successfully updated song."
            redirect("/songs/#{@song.slug}")
          end
    end

    get '/songs/new' do
        @genres = Genre.all
        erb :'/songs/new'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end
    
    get '/songs/:slug/edit' do

        @song = Song.find_by_slug(params[:slug])
        @artists = Artist.all
        @genres = Genre.all
        erb :'/songs/edit'
    end
end